import Observation
import Foundation
import CoreBluetooth

@MainActor @Observable final class BluetoothManager: NSObject {
    var state: ConnectionState = .unavailable
    var discovered: [CBPeripheral] = []
    var names: [UUID: String] = [:]
    var rssis: [UUID: NSNumber] = [:]
    var batteries: [UUID: Int] = [:]

    private var central: CBCentralManager!
    private var peripheral: CBPeripheral?
    private var writeCharacteristic: CBCharacteristic?
    private var notifyCharacteristic: CBCharacteristic?
    private var connectionContinuation: CheckedContinuation<Void, Error>?
    private var discoveryContinuation: CheckedContinuation<Void, Error>?
    private var notifyContinuation: CheckedContinuation<Void, Error>?
    private var responseContinuation: CheckedContinuation<Data, Error>?
    private var operationInFlight = false
    private var autoConnectTarget: UUID?
    private var autoConnectThreshold = -90
    private var monitoringTask: Task<Void, Never>?
    private var pendingPeripheralID: UUID?
    private var pendingPeripheralContinuation: CheckedContinuation<CBPeripheral, Error>?
    private var pendingUnboundPeripheralContinuation: CheckedContinuation<CBPeripheral, Error>?
    private var pendingUnboundCandidates: [UUID: (peripheral: CBPeripheral, rssi: NSNumber)] = [:]
    private var pendingUnboundSelectionTask: Task<Void, Never>?
    private var shouldScanWhenPoweredOn = false
    private var appInForeground = true
    private var retainConnectionInBackground = false
    private var backgroundReleaseTask: Task<Void, Never>?
    private var reconnectingForForeground = false
    private var foregroundReconnectTask: Task<Void, Never>?

    override init() {
        super.init()
        central = CBCentralManager(delegate: self, queue: .main, options: [CBCentralManagerOptionRestoreIdentifierKey: "com.ebato.easyopen.central"])
    }

    func scan() {
        shouldScanWhenPoweredOn = true
        guard central.state == .poweredOn else { state = .unavailable; return }
        autoConnectTarget = nil
        discovered.removeAll(); names.removeAll(); rssis.removeAll(); batteries.removeAll()
        state = .scanning
        central.scanForPeripherals(withServices: nil, options: [CBCentralManagerScanOptionAllowDuplicatesKey: false])
    }

    func startMonitoring(profile: DeviceProfile, minimumRSSI: Int = -90) {
        stopMonitoring()
        monitoringTask = Task { @MainActor in
            while !Task.isCancelled {
                self.autoConnect(profile: profile, minimumRSSI: minimumRSSI)
                try? await Task.sleep(for: .seconds(12))
            }
        }
    }

    func stopMonitoring() {
        monitoringTask?.cancel(); monitoringTask = nil
        autoConnectTarget = nil
        shouldScanWhenPoweredOn = false
        central?.stopScan()
    }

    func enterBackground(keepConnection: Bool = false) {
        appInForeground = false
        retainConnectionInBackground = keepConnection
        backgroundReleaseTask?.cancel()
        backgroundReleaseTask = nil
        foregroundReconnectTask?.cancel()
        foregroundReconnectTask = nil
        reconnectingForForeground = false
        stopMonitoring()
        if operationInFlight {
            // Let an active pairing/unlock finish, then release or retain the GATT link.
            return
        }
        if keepConnection && hasUsableConnection {
            // NFC can reuse the ready GATT session when the app is brought back.
            scheduleBackgroundRelease()
            return
        }
        disconnect()
    }

    func enterForeground(profile: DeviceProfile?) {
        appInForeground = true
        retainConnectionInBackground = false
        backgroundReleaseTask?.cancel()
        backgroundReleaseTask = nil
        foregroundReconnectTask?.cancel()
        foregroundReconnectTask = nil
        guard let profile, !hasUsableConnection(for: profile) else { return }
        reconnectingForForeground = true
        foregroundReconnectTask = Task { @MainActor in
            defer {
                self.reconnectingForForeground = false
                self.foregroundReconnectTask = nil
            }
            guard !Task.isCancelled, self.appInForeground else { return }
            try? await self.connectIfNeeded(profile: profile, waitForForegroundReconnect: false)
        }
    }

    func autoConnect(profile: DeviceProfile, minimumRSSI: Int = -90) {
        guard let target = profile.peripheralIdentifier, central.state == .poweredOn, !operationInFlight, !reconnectingForForeground else { return }
        autoConnectTarget = target; autoConnectThreshold = minimumRSSI
        state = .scanning
        central.scanForPeripherals(withServices: nil, options: [CBCentralManagerScanOptionAllowDuplicatesKey: false])
        Task { @MainActor in
            try? await Task.sleep(for: .seconds(10))
            if self.autoConnectTarget == target { self.stopScan() }
        }
    }

    func stopScan() {
        central.stopScan(); autoConnectTarget = nil; shouldScanWhenPoweredOn = false
        if state == .scanning { state = .discovered }
    }

    func connect(_ p: CBPeripheral) async throws {
        guard !operationInFlight else { throw AppError.operationInProgress }
        guard central.state == .poweredOn else { throw AppError.bluetoothUnavailable }
        operationInFlight = true
        defer {
            operationInFlight = false
            if !appInForeground {
                if retainConnectionInBackground { scheduleBackgroundRelease() } else { disconnect() }
            }
        }
        stopScan(); state = .connecting; peripheral = p; p.delegate = self
        try await awaitConnection(p)
        try await discover()
        state = .ready
    }

    private func awaitConnection(_ p: CBPeripheral) async throws {
        try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<Void, Error>) in
            self.connectionContinuation = continuation
            self.central.connect(p)
            Task { @MainActor in
                try? await Task.sleep(for: .seconds(12))
                if self.connectionContinuation != nil {
                    self.connectionContinuation?.resume(throwing: AppError.connectionTimeout)
                    self.connectionContinuation = nil
                }
            }
        }
    }

    private func discover() async throws {
        guard let p = peripheral else { throw AppError.deviceNotFound }
        writeCharacteristic = nil; notifyCharacteristic = nil
        try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<Void, Error>) in
            self.discoveryContinuation = continuation
            p.discoverServices([CBUUID(string: UnlockProtocol.serviceUUID)])
            Task { @MainActor in
                try? await Task.sleep(for: .seconds(8))
                if self.discoveryContinuation != nil {
                    self.discoveryContinuation?.resume(throwing: AppError.serviceMissing)
                    self.discoveryContinuation = nil
                    self.notifyContinuation = nil
                }
            }
        }
    }

    func connectIfNeeded(profile: DeviceProfile, waitForForegroundReconnect: Bool = true) async throws {
        if waitForForegroundReconnect, reconnectingForForeground, let task = foregroundReconnectTask {
            // The scene may start its foreground reconnect just before a shortcut URL
            // is delivered. Reuse that in-flight connection instead of reporting a
            // false operation-in-progress error and dropping the unlock request.
            await task.value
        }
        if hasUsableConnection(for: profile) { state = .ready; return }

        // Android backups contain a Bluetooth MAC address, but iOS deliberately does
        // not expose that address. When an imported profile has no iOS UUID yet,
        // discover the compatible YILA opener and bind by its CoreBluetooth UUID at
        // the call site (or use the selected device for this session). This makes a
        // single imported opener usable immediately instead of failing with
        // "device not found" before any scan was attempted.
        guard let id = profile.peripheralIdentifier else {
            let candidate = try await waitForUnboundPeripheral()
            try await connect(candidate)
            return
        }
        let systemConnected = central.retrieveConnectedPeripherals(
            withServices: [CBUUID(string: UnlockProtocol.serviceUUID)]
        ).first(where: { $0.identifier == id })
        let candidate = discovered.first(where: { $0.identifier == id }) ?? systemConnected ?? central.retrievePeripherals(withIdentifiers: [id]).first
        if let candidate { try await connect(candidate); return }
        let discoveredPeripheral = try await waitForPeripheral(id)
        try await connect(discoveredPeripheral)
    }

    private func waitForUnboundPeripheral() async throws -> CBPeripheral {
        guard central.state == .poweredOn else { throw AppError.bluetoothUnavailable }
        pendingUnboundSelectionTask?.cancel()
        pendingUnboundCandidates.removeAll()
        discovered.removeAll(); names.removeAll(); rssis.removeAll(); batteries.removeAll()
        state = .scanning
        central.stopScan()
        central.scanForPeripherals(withServices: nil, options: [CBCentralManagerScanOptionAllowDuplicatesKey: false])
        return try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<CBPeripheral, Error>) in
            pendingUnboundPeripheralContinuation = continuation
            pendingUnboundSelectionTask = Task { @MainActor in
                try? await Task.sleep(for: .seconds(1))
                guard !Task.isCancelled, let continuation = self.pendingUnboundPeripheralContinuation else { return }
                self.pendingUnboundPeripheralContinuation = nil
                self.pendingUnboundSelectionTask = nil
                self.central.stopScan()
                guard let candidate = self.pendingUnboundCandidates.values.max(by: { $0.rssi.intValue < $1.rssi.intValue })?.peripheral else {
                    continuation.resume(throwing: AppError.deviceNotFound)
                    self.state = .discovered
                    return
                }
                continuation.resume(returning: candidate)
                self.state = .discovered
            }
        }
    }


    private func waitForPeripheral(_ id: UUID) async throws -> CBPeripheral {
        guard central.state == .poweredOn else { throw AppError.bluetoothUnavailable }
        return try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<CBPeripheral, Error>) in
            self.pendingPeripheralID = id
            self.pendingPeripheralContinuation = continuation
            self.discovered.removeAll()
            self.state = .scanning
            self.central.scanForPeripherals(withServices: nil, options: [CBCentralManagerScanOptionAllowDuplicatesKey: false])
            Task { @MainActor in
                try? await Task.sleep(for: .seconds(12))
                if self.pendingPeripheralContinuation != nil {
                    self.pendingPeripheralContinuation?.resume(throwing: AppError.deviceNotFound)
                    self.pendingPeripheralContinuation = nil
                    self.pendingPeripheralID = nil
                    self.central.stopScan()
                    self.state = .discovered
                }
            }
        }
    }

    func pair(password: String) async throws {
        guard !operationInFlight else { throw AppError.operationInProgress }
        guard let c = writeCharacteristic, let n = notifyCharacteristic else { throw AppError.serviceMissing }
        operationInFlight = true
        defer {
            operationInFlight = false
            if !appInForeground {
                if retainConnectionInBackground { scheduleBackgroundRelease() } else { disconnect() }
            }
        }
        try await write(try UnlockProtocol.buildPasswordPacket(password: password), characteristic: c, notify: n)
    }

    func unlock(profile: DeviceProfile, password: String) async throws {
        guard !operationInFlight else { throw AppError.operationInProgress }
        if hasUsableConnection(for: profile) { state = .ready }
        guard state == .ready, let c = writeCharacteristic, let n = notifyCharacteristic else { throw AppError.serviceMissing }
        operationInFlight = true; state = .unlocking
        defer {
            operationInFlight = false
            if state == .unlocking { state = .ready }
            if !appInForeground {
                if retainConnectionInBackground { scheduleBackgroundRelease() } else { disconnect() }
            }
        }
        try await write(try UnlockProtocol.buildOpenPacket(profile: profile, password: password), characteristic: c, notify: n)
        state = .success
    }

    private func write(_ data: Data, characteristic: CBCharacteristic, notify: CBCharacteristic) async throws {
        guard let peripheral else { throw AppError.deviceNotFound }
        guard notifyCharacteristic?.uuid == notify.uuid else { throw AppError.serviceMissing }
        peripheral.writeValue(data, for: characteristic, type: characteristic.properties.contains(.writeWithoutResponse) ? .withoutResponse : .withResponse)
        let response = try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<Data, Error>) in
            self.responseContinuation = continuation
            Task { @MainActor in
                try? await Task.sleep(for: .seconds(8))
                if self.responseContinuation != nil {
                    self.responseContinuation?.resume(throwing: AppError.operationTimeout)
                    self.responseContinuation = nil
                }
            }
        }
        if UnlockProtocol.isFailure(response) { throw AppError.writeFailed }
        if !UnlockProtocol.isSuccess(response) { throw AppError.writeFailed }
    }

    private var hasUsableConnection: Bool {
        peripheral?.state == .connected && writeCharacteristic != nil && notifyCharacteristic != nil
    }

    private func hasUsableConnection(for profile: DeviceProfile) -> Bool {
        guard let expectedID = profile.peripheralIdentifier else { return false }
        return hasUsableConnection && peripheral?.identifier == expectedID
    }

    private func scheduleBackgroundRelease() {
        backgroundReleaseTask?.cancel()
        // ponytail: keep the GATT lease to Android's 2s window, then release the channel.
        backgroundReleaseTask = Task { @MainActor in
            try? await Task.sleep(for: .seconds(2))
            guard !Task.isCancelled, !self.appInForeground,
                  self.retainConnectionInBackground, self.hasUsableConnection else { return }
            self.disconnect()
        }
    }

    func disconnect() {
        retainConnectionInBackground = false
        backgroundReleaseTask?.cancel()
        backgroundReleaseTask = nil
        if let p = peripheral { central.cancelPeripheralConnection(p) }
        clearPending(error: AppError.deviceNotFound); peripheral = nil; writeCharacteristic = nil; notifyCharacteristic = nil; state = .disconnected
    }

    private func clearPending(error: Error) {
        connectionContinuation?.resume(throwing: error); connectionContinuation = nil
        discoveryContinuation?.resume(throwing: error); discoveryContinuation = nil
        notifyContinuation?.resume(throwing: error); notifyContinuation = nil
        responseContinuation?.resume(throwing: error); responseContinuation = nil
        pendingPeripheralContinuation?.resume(throwing: error); pendingPeripheralContinuation = nil; pendingPeripheralID = nil
        pendingUnboundSelectionTask?.cancel(); pendingUnboundSelectionTask = nil
        pendingUnboundPeripheralContinuation?.resume(throwing: error); pendingUnboundPeripheralContinuation = nil
        pendingUnboundCandidates.removeAll()
    }
    private func advertisedName(_ peripheral: CBPeripheral, _ advertisementData: [String: Any]) -> String {
        (advertisementData[CBAdvertisementDataLocalNameKey] as? String) ?? peripheral.name ?? ""
    }

    /// Mirrors Android's discovery rule while also accepting a service-only
    /// advertisement, which some YILA firmware versions use.
    private func isCompatibleAdvertisement(_ peripheral: CBPeripheral, _ advertisementData: [String: Any]) -> Bool {
        let name = advertisedName(peripheral, advertisementData).trimmingCharacters(in: .whitespacesAndNewlines)
        let normalized = name.uppercased()
        if normalized.contains("REMOTE") { return false }
        let serviceUUID = CBUUID(string: UnlockProtocol.serviceUUID)
        let advertisedServices = advertisementData[CBAdvertisementDataServiceUUIDsKey] as? [CBUUID] ?? []
        return normalized.contains("YILA") || advertisedServices.contains(serviceUUID)
    }
}

extension BluetoothManager: CBCentralManagerDelegate {
    nonisolated func centralManagerDidUpdateState(_ central: CBCentralManager) {
        Task { @MainActor in
            if central.state == .poweredOn {
                self.state = .disconnected
                if self.shouldScanWhenPoweredOn { self.scan() }
            } else {
                self.state = .unavailable
            }
        }
    }

    nonisolated func centralManager(_ central: CBCentralManager, didDiscover p: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        Task { @MainActor in
            // Do not use a CoreBluetooth service scan filter here. Android scans
            // unfiltered and then checks the advertised YILA name; filtering at the
            // iOS scanner level misses devices whose firmware omits the service UUID
            // from the advertisement packet.
            let isKnownTarget = self.pendingPeripheralID == p.identifier || self.autoConnectTarget == p.identifier
            guard isKnownTarget || self.isCompatibleAdvertisement(p, advertisementData) else { return }
            if !self.discovered.contains(where: { $0.identifier == p.identifier }) { self.discovered.append(p) }
            let name = self.advertisedName(p, advertisementData)
            self.names[p.identifier] = name.isEmpty ? "未命名 YILA" : name
            self.rssis[p.identifier] = RSSI
            if let data = advertisementData[CBAdvertisementDataManufacturerDataKey] as? Data, let battery = BatteryAdvertisementParser.parse(data) { self.batteries[p.identifier] = battery }
            if self.pendingUnboundPeripheralContinuation != nil {
                self.pendingUnboundCandidates[p.identifier] = (p, RSSI)
            }
            if self.pendingPeripheralID == p.identifier {
                self.pendingPeripheralContinuation?.resume(returning: p)
                self.pendingPeripheralContinuation = nil
                self.pendingPeripheralID = nil
                self.central.stopScan()
            }
            self.state = .discovered
            if self.autoConnectTarget == p.identifier, RSSI.intValue >= self.autoConnectThreshold, !self.operationInFlight {
                self.autoConnectTarget = nil
                Task { try? await self.connect(p) }
            }
        }
    }

    nonisolated func centralManager(_ central: CBCentralManager, didConnect p: CBPeripheral) { Task { @MainActor in self.connectionContinuation?.resume(); self.connectionContinuation = nil } }
    nonisolated func centralManager(_ central: CBCentralManager, didFailToConnect p: CBPeripheral, error: Error?) { Task { @MainActor in self.connectionContinuation?.resume(throwing: error ?? AppError.connectionTimeout); self.connectionContinuation = nil; self.state = .failure((error as NSError?)?.localizedDescription ?? AppError.connectionTimeout.localizedDescription) } }
    nonisolated func centralManager(_ central: CBCentralManager, didDisconnectPeripheral p: CBPeripheral, error: Error?) { Task { @MainActor in self.clearPending(error: error ?? AppError.deviceNotFound); self.writeCharacteristic = nil; self.notifyCharacteristic = nil; self.state = .disconnected } }
    nonisolated func centralManager(_ central: CBCentralManager, willRestoreState dict: [String : Any]) {
        Task { @MainActor in
            if let restored = dict[CBCentralManagerRestoredStatePeripheralsKey] as? [CBPeripheral], let first = restored.first { self.peripheral = first; first.delegate = self }
        }
    }
}

extension BluetoothManager: CBPeripheralDelegate {
    nonisolated func peripheral(_ p: CBPeripheral, didDiscoverServices error: Error?) {
        Task { @MainActor in
            guard error == nil, let service = p.services?.first(where: { $0.uuid == CBUUID(string: UnlockProtocol.serviceUUID) }) else { self.discoveryContinuation?.resume(throwing: error ?? AppError.serviceMissing); self.discoveryContinuation = nil; return }
            p.discoverCharacteristics([CBUUID(string: UnlockProtocol.writeUUID), CBUUID(string: UnlockProtocol.notifyUUID)], for: service)
        }
    }

    nonisolated func peripheral(_ p: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
        Task { @MainActor in
            guard error == nil else { self.discoveryContinuation?.resume(throwing: AppError.serviceMissing); self.discoveryContinuation = nil; return }
            self.writeCharacteristic = service.characteristics?.first { $0.uuid == CBUUID(string: UnlockProtocol.writeUUID) }
            self.notifyCharacteristic = service.characteristics?.first { $0.uuid == CBUUID(string: UnlockProtocol.notifyUUID) }
            guard let n = self.notifyCharacteristic, self.writeCharacteristic != nil else { self.discoveryContinuation?.resume(throwing: AppError.serviceMissing); self.discoveryContinuation = nil; return }
            self.notifyContinuation = self.discoveryContinuation
            self.discoveryContinuation = nil
            p.setNotifyValue(true, for: n)
        }
    }

    nonisolated func peripheral(_ p: CBPeripheral, didUpdateNotificationStateFor characteristic: CBCharacteristic, error: Error?) {
        Task { @MainActor in
            guard characteristic.uuid == CBUUID(string: UnlockProtocol.notifyUUID) else { return }
            if let error { self.notifyContinuation?.resume(throwing: error) }
            else if characteristic.isNotifying { self.notifyContinuation?.resume() }
            else { self.notifyContinuation?.resume(throwing: AppError.serviceMissing) }
            self.notifyContinuation = nil
        }
    }

    nonisolated func peripheral(_ p: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic, error: Error?) {
        Task { @MainActor in
            guard characteristic.uuid == CBUUID(string: UnlockProtocol.notifyUUID) else { return }
            if let error { self.responseContinuation?.resume(throwing: error) } else { self.responseContinuation?.resume(returning: characteristic.value ?? Data()) }
            self.responseContinuation = nil
        }
    }
}
