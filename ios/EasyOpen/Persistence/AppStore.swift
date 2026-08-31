import Observation
import Foundation

@MainActor @Observable final class AppStore {
    var devices: [DeviceProfile] = []
    var activeDeviceID: UUID? { didSet { UserDefaults.standard.set(activeDeviceID?.uuidString, forKey: "activeDeviceID") } }
    var savePasswords = true { didSet { UserDefaults.standard.set(savePasswords, forKey: "savePasswords") } }
    var nfcAutoUnlock = false { didSet { UserDefaults.standard.set(nfcAutoUnlock, forKey: "nfcAutoUnlock") } }
    var autoUnlockOnAppOpen = false { didSet { UserDefaults.standard.set(autoUnlockOnAppOpen, forKey: "autoUnlockOnAppOpen") } }
    var autoConnectEnabled = true { didSet { UserDefaults.standard.set(autoConnectEnabled, forKey: "autoConnectEnabled") } }
    var autoConnectRange = 0 { didSet { UserDefaults.standard.set(autoConnectRange, forKey: "autoConnectRange") } }
    var customAutoConnectRssi = -90 { didSet { UserDefaults.standard.set(customAutoConnectRssi, forKey: "customAutoConnectRssi") } }
    var themeMode = 0 { didSet { UserDefaults.standard.set(themeMode, forKey: "themeMode") } }
    var monetEnabled = false { didSet { UserDefaults.standard.set(monetEnabled, forKey: "monetEnabled") } }
    let keychain = KeychainStore()
    private let fileURL: URL

    init() {
        let defaults = UserDefaults.standard
        savePasswords = defaults.object(forKey: "savePasswords") as? Bool ?? true
        nfcAutoUnlock = defaults.bool(forKey: "nfcAutoUnlock")
        autoUnlockOnAppOpen = defaults.bool(forKey: "autoUnlockOnAppOpen")
        autoConnectEnabled = defaults.object(forKey: "autoConnectEnabled") as? Bool ?? true
        autoConnectRange = defaults.integer(forKey: "autoConnectRange")
        customAutoConnectRssi = defaults.object(forKey: "customAutoConnectRssi") as? Int ?? -90
        themeMode = defaults.integer(forKey: "themeMode")
        monetEnabled = defaults.bool(forKey: "monetEnabled")
        fileURL = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask)[0].appendingPathComponent("devices.json")
        load()
    }

    var activeDevice: DeviceProfile? { devices.first { $0.id == activeDeviceID } ?? devices.first }
    func password(for profile: DeviceProfile) -> String? { keychain.read(for: profile.passwordKeychainID) }

    func add(_ profile: DeviceProfile, password: String) throws {
        if devices.contains(where: { $0.peripheralIdentifier == profile.peripheralIdentifier && profile.peripheralIdentifier != nil }) { throw AppError.duplicateDevice }
        if savePasswords { try keychain.save(password, for: profile.passwordKeychainID) }
        devices.append(profile); activeDeviceID = profile.id; persist()
    }

    func update(_ profile: DeviceProfile, password: String? = nil) throws {
        guard let index = devices.firstIndex(where: { $0.id == profile.id }) else { return }
        if let password, savePasswords { try keychain.save(password, for: profile.passwordKeychainID) }
        devices[index] = profile; persist()
    }

    /// Merge a shared Android/iOS backup. A matching legacy MAC updates the existing
    /// profile while retaining its iOS peripheral UUID; new profiles remain unbound.
    func importBackup(_ snapshot: BackupSnapshot) throws {
        for imported in snapshot.devices {
            let address = imported.profile.legacyAddress?.uppercased()
            if let index = devices.firstIndex(where: { $0.legacyAddress?.uppercased() == address && address != nil }) {
                var existing = devices[index]
                existing.name = imported.profile.name
                existing.legacyAddress = imported.profile.legacyAddress
                existing.attribute = imported.profile.attribute
                existing.openTimeMs = imported.profile.openTimeMs
                existing.waitTimeMs = imported.profile.waitTimeMs
                existing.closeTimeMs = imported.profile.closeTimeMs
                existing.batteryLevel = imported.profile.batteryLevel
                if savePasswords { try keychain.save(imported.password, for: existing.passwordKeychainID) } else { keychain.delete(existing.passwordKeychainID) }
                devices[index] = existing
            } else {
                var profile = imported.profile
                profile.id = UUID()
                profile.peripheralIdentifier = nil
                profile.passwordKeychainID = UUID().uuidString
                if savePasswords { try keychain.save(imported.password, for: profile.passwordKeychainID) }
                devices.append(profile)
            }
        }
        themeMode = snapshot.themeMode; monetEnabled = snapshot.monetEnabled
        autoUnlockOnAppOpen = snapshot.autoUnlockOnAppOpen; autoConnectEnabled = snapshot.autoConnectEnabled
        autoConnectRange = snapshot.autoConnectRange; customAutoConnectRssi = snapshot.customAutoConnectRssi
        activeDeviceID = devices.first(where: { $0.legacyAddress?.caseInsensitiveCompare(snapshot.activeAddress) == .orderedSame })?.id ?? devices.first?.id
        persist()
    }

    func bind(_ profile: DeviceProfile, to peripheralIdentifier: UUID) {
        guard let index = devices.firstIndex(where: { $0.id == profile.id }) else { return }
        devices[index].peripheralIdentifier = peripheralIdentifier
        persist()
    }

    func updateBattery(for peripheralIdentifier: UUID, level: Int) {
        guard let index = devices.firstIndex(where: { $0.peripheralIdentifier == peripheralIdentifier }) else { return }
        devices[index].batteryLevel = min(max(level, 1), 5)
        persist()
    }

    func remove(_ profile: DeviceProfile) {
        keychain.delete(profile.passwordKeychainID); devices.removeAll { $0.id == profile.id }
        if activeDeviceID == profile.id { activeDeviceID = devices.first?.id }; persist()
    }

    func persist() {
        do { try FileManager.default.createDirectory(at: fileURL.deletingLastPathComponent(), withIntermediateDirectories: true); try JSONEncoder().encode(devices).write(to: fileURL, options: .atomic) } catch { }
    }
    private func load() {
        if let data = try? Data(contentsOf: fileURL), let decoded = try? JSONDecoder().decode([DeviceProfile].self, from: data) { devices = decoded; activeDeviceID = UserDefaults.standard.string(forKey: "activeDeviceID").flatMap(UUID.init) ?? devices.first?.id }
    }
}
