import Foundation
import CryptoKit

struct ImportedProfile { var profile: DeviceProfile; var password: String }

struct BackupSnapshot {
    var devices: [ImportedProfile]
    var activeAddress: String
    var themeMode: Int
    var monetEnabled: Bool
    var autoUnlockOnAppOpen: Bool
    var autoConnectEnabled: Bool
    var autoConnectRange: Int
    var customAutoConnectRssi: Int
}

struct TransferCodec {
    private static let seed = SymmetricKey(data: SHA256.hash(data: Data("EasyOpen opener transfer v1".utf8)))
    private struct LegacyProfile: Codable {
        var name: String
        var address: String
        var password: String
        var attribute: Int
        var openTimeMs: Int
        var waitTimeMs: Int
        var closeTimeMs: Int
        var batteryLevel: Int?
        var iosPeripheralIdentifier: String? = nil
    }
    private struct LegacyEnvelope: Codable {
        var version: Int
        var devices: [LegacyProfile]
    }
    private struct BackupEnvelope: Codable {
        var version: Int
        var activeAddress: String
        var themeMode: Int
        var monetEnabled: Bool
        var autoUnlockOnAppOpen: Bool
        var autoConnectEnabled: Bool
        var autoConnectRange: Int
        var customAutoConnectRssi: Int
        var devices: [LegacyProfile]
        enum CodingKeys: String, CodingKey { case version, activeAddress, themeMode, monetEnabled, autoUnlockOnAppOpen, autoConnectEnabled, autoConnectRange, customAutoConnectRssi, devices }
        init(version: Int, activeAddress: String, themeMode: Int, monetEnabled: Bool, autoUnlockOnAppOpen: Bool, autoConnectEnabled: Bool, autoConnectRange: Int, customAutoConnectRssi: Int, devices: [LegacyProfile]) {
            self.version = version; self.activeAddress = activeAddress; self.themeMode = themeMode; self.monetEnabled = monetEnabled; self.autoUnlockOnAppOpen = autoUnlockOnAppOpen; self.autoConnectEnabled = autoConnectEnabled; self.autoConnectRange = autoConnectRange; self.customAutoConnectRssi = customAutoConnectRssi; self.devices = devices
        }
        init(from decoder: Decoder) throws {
            let c = try decoder.container(keyedBy: CodingKeys.self)
            version = try c.decode(Int.self, forKey: .version); activeAddress = try c.decode(String.self, forKey: .activeAddress); themeMode = try c.decode(Int.self, forKey: .themeMode); monetEnabled = try c.decode(Bool.self, forKey: .monetEnabled)
            autoUnlockOnAppOpen = try c.decodeIfPresent(Bool.self, forKey: .autoUnlockOnAppOpen) ?? false; autoConnectEnabled = try c.decodeIfPresent(Bool.self, forKey: .autoConnectEnabled) ?? true; autoConnectRange = try c.decodeIfPresent(Int.self, forKey: .autoConnectRange) ?? 0; customAutoConnectRssi = try c.decodeIfPresent(Int.self, forKey: .customAutoConnectRssi) ?? -90; devices = try c.decode([LegacyProfile].self, forKey: .devices)
        }
    }

    static func encodeShare(_ devices: [DeviceProfile], passwords: [UUID: String]) throws -> String {
        guard !devices.isEmpty, devices.count <= 255 else { throw AppError.invalidPacket }
        var raw = Data([1, UInt8(devices.count)])
        for device in devices {
            let address = (device.legacyAddress ?? "00:00:00:00:00:00").split(separator: ":").compactMap { UInt8($0, radix: 16) }
            guard address.count == 6, let password = passwords[device.id], password.count == 6 else { throw AppError.invalidPacket }
            raw.append(contentsOf: address)
            raw.append(contentsOf: password.utf8)
            raw.append(UInt8(device.attribute.clamped(to: 0...1)))
            for value in [device.openTimeMs, device.waitTimeMs, device.closeTimeMs] {
                let clamped = value.clamped(to: 0...60000)
                raw.append(UInt8((clamped >> 8) & 0xff)); raw.append(UInt8(clamped & 0xff))
            }
            raw.append(UInt8(device.batteryLevel?.clamped(to: 1...5) ?? 0))
            let name = Data((device.name.isEmpty ? "我的开门器" : device.name).utf8)
            guard name.count <= 255 else { throw AppError.invalidPacket }
            raw.append(UInt8(name.count)); raw.append(name)
        }
        return "EASYOPEN-SHARE:2:" + (try encrypt(raw))
    }

    static func decodeShare(_ value: String) -> [ImportedProfile]? {
        let isV1 = value.hasPrefix("EASYOPEN-SHARE:1:")
        let isV2 = value.hasPrefix("EASYOPEN-SHARE:2:")
        guard isV1 || isV2 else { return nil }
        let raw = String(value.dropFirst(isV1 ? "EASYOPEN-SHARE:1:".count : "EASYOPEN-SHARE:2:".count))
        guard let plain = decrypt(raw) else { return nil }
        if isV2 { return decodeCompact(plain) }
        guard let env = try? JSONDecoder().decode(LegacyEnvelope.self, from: plain), env.version == 1 else { return nil }
        return env.devices.compactMap(makeImported)
    }

    /// Android-compatible v1 backup. This is deliberately plain JSON because Android's
    /// existing file format is plain JSON and users may move it through Files/AirDrop.
    static func encodeBackup(
        devices: [DeviceProfile], passwords: [UUID: String], activeDevice: DeviceProfile?,
        themeMode: Int = 0, monetEnabled: Bool = false, autoUnlockOnAppOpen: Bool = false,
        autoConnectEnabled: Bool = true, autoConnectRange: Int = 0, customAutoConnectRssi: Int = -90
    ) throws -> Data {
        let profiles = try devices.map { device -> LegacyProfile in
            guard let password = passwords[device.id], password.count == 6, password.allSatisfy(\.isNumber) else { throw AppError.invalidPassword }
            return LegacyProfile(name: device.name, address: normalizedAddress(device.legacyAddress), password: password,
                                 attribute: device.attribute.clamped(to: 0...1), openTimeMs: device.openTimeMs.clamped(to: 0...60000),
                                 waitTimeMs: device.waitTimeMs.clamped(to: 0...60000), closeTimeMs: device.closeTimeMs.clamped(to: 0...60000),
                                 batteryLevel: device.batteryLevel.map { $0.clamped(to: 1...5) },
                                 iosPeripheralIdentifier: device.peripheralIdentifier?.uuidString)
        }
        let envelope = BackupEnvelope(version: 1, activeAddress: normalizedAddress(activeDevice?.legacyAddress),
                                      themeMode: themeMode.clamped(to: 0...2), monetEnabled: monetEnabled,
                                      autoUnlockOnAppOpen: autoUnlockOnAppOpen, autoConnectEnabled: autoConnectEnabled,
                                      autoConnectRange: autoConnectRange.clamped(to: 0...2), customAutoConnectRssi: customAutoConnectRssi.clamped(to: -100...0), devices: profiles)
        let encoder = JSONEncoder(); encoder.outputFormatting = [.sortedKeys]
        return try encoder.encode(envelope)
    }

    static func decodeBackup(_ data: Data) -> BackupSnapshot? {
        guard let env = try? JSONDecoder().decode(BackupEnvelope.self, from: data), env.version == 1 else { return nil }
        let imported = env.devices.compactMap(makeImported)
        guard !imported.isEmpty else { return nil }
        let active = normalizedAddress(env.activeAddress)
        let activeAddress = imported.contains(where: { normalizedAddress($0.profile.legacyAddress).caseInsensitiveCompare(active) == .orderedSame }) ? active : normalizedAddress(imported[0].profile.legacyAddress)
        return BackupSnapshot(devices: imported, activeAddress: activeAddress, themeMode: env.themeMode.clamped(to: 0...2), monetEnabled: env.monetEnabled,
                              autoUnlockOnAppOpen: env.autoUnlockOnAppOpen, autoConnectEnabled: env.autoConnectEnabled,
                              autoConnectRange: env.autoConnectRange.clamped(to: 0...2), customAutoConnectRssi: env.customAutoConnectRssi.clamped(to: -100...0))
    }

    private static func encodeBase64URL(_ data: Data) -> String {
        data.base64EncodedString().replacingOccurrences(of: "+", with: "-").replacingOccurrences(of: "/", with: "_").replacingOccurrences(of: "=", with: "")
    }
    private static func decodeBase64URL(_ value: String) -> Data? {
        var string = value.replacingOccurrences(of: "-", with: "+").replacingOccurrences(of: "_", with: "/")
        string += String(repeating: "=", count: (4 - string.count % 4) % 4)
        return Data(base64Encoded: string)
    }
    private static func encrypt(_ data: Data) throws -> String {
        let nonce = AES.GCM.Nonce(); let box = try AES.GCM.seal(data, using: seed, nonce: nonce)
        return encodeBase64URL(Data(nonce)) + "." + encodeBase64URL(box.ciphertext + box.tag)
    }
    private static func decrypt(_ value: String) -> Data? {
        let parts = value.split(separator: ".", maxSplits: 1).map(String.init)
        guard parts.count == 2, let iv = decodeBase64URL(parts[0]), iv.count == 12, let encrypted = decodeBase64URL(parts[1]), encrypted.count >= 16,
              let nonce = try? AES.GCM.Nonce(data: iv) else { return nil }
        let box = try? AES.GCM.SealedBox(nonce: nonce, ciphertext: encrypted.dropLast(16), tag: encrypted.suffix(16))
        return box.flatMap { try? AES.GCM.open($0, using: seed) }
    }
    private static func decodeCompact(_ data: Data) -> [ImportedProfile]? {
        var cursor = 0
        func byte() -> UInt8? { guard cursor < data.count else { return nil }; defer { cursor += 1 }; return data[cursor] }
        guard byte() == 1, let count = byte(), count > 0 else { return nil }
        var result: [ImportedProfile] = []
        for _ in 0..<count {
            guard cursor + 6 <= data.count else { return nil }
            let address = data[cursor..<cursor+6].map { String(format: "%02X", $0) }.joined(separator: ":"); cursor += 6
            guard cursor + 6 <= data.count else { return nil }
            let password = String(decoding: data[cursor..<cursor+6], as: UTF8.self); cursor += 6
            guard let attribute = byte(), let oh = byte(), let ol = byte(), let wh = byte(), let wl = byte(), let ch = byte(), let cl = byte(), let battery = byte(), let length = byte(), cursor + Int(length) <= data.count else { return nil }
            let name = String(decoding: data[cursor..<cursor+Int(length)], as: UTF8.self); cursor += Int(length)
            result.append(ImportedProfile(profile: DeviceProfile(name: name.isEmpty ? "我的开门器" : name, legacyAddress: address,
                attribute: Int(attribute).clamped(to: 0...1), openTimeMs: (Int(oh) << 8 | Int(ol)).clamped(to: 0...60000),
                waitTimeMs: (Int(wh) << 8 | Int(wl)).clamped(to: 0...60000), closeTimeMs: (Int(ch) << 8 | Int(cl)).clamped(to: 0...60000),
                batteryLevel: battery == 0 ? nil : Int(battery).clamped(to: 1...5)), password: password))
        }
        return cursor == data.count ? result : nil
    }
    private static func makeImported(_ p: LegacyProfile) -> ImportedProfile? {
        guard p.password.count == 6, p.password.allSatisfy(\.isNumber), p.address.range(of: "^[0-9A-Fa-f]{2}(:[0-9A-Fa-f]{2}){5}$", options: .regularExpression) != nil else { return nil }
        return ImportedProfile(profile: DeviceProfile(name: p.name.isEmpty ? "我的开门器" : p.name,
            peripheralIdentifier: p.iosPeripheralIdentifier.flatMap(UUID.init),
            legacyAddress: normalizedAddress(p.address), attribute: p.attribute.clamped(to: 0...1),
            openTimeMs: p.openTimeMs.clamped(to: 0...60000), waitTimeMs: p.waitTimeMs.clamped(to: 0...60000),
            closeTimeMs: p.closeTimeMs.clamped(to: 0...60000), batteryLevel: p.batteryLevel?.clamped(to: 1...5)), password: p.password)
    }
    private static func normalizedAddress(_ value: String?) -> String { value?.uppercased() ?? "00:00:00:00:00:00" }
}

extension FixedWidthInteger { fileprivate func clamped(to range: ClosedRange<Self>) -> Self { Swift.min(Swift.max(self, range.lowerBound), range.upperBound) } }
