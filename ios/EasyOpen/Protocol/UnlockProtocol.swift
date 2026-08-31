import Foundation
import CommonCrypto

struct UnlockProtocol {
    static let serviceUUID = CBUUIDString.service
    static let writeUUID = CBUUIDString.write
    static let notifyUUID = CBUUIDString.notify
    private static let key = Array("Fx4k6AWivOsLE4NI".utf8)
    static func passwordToken(_ password: String) -> String {
        if password.range(of: "^[0-9a-fA-F]{16}$", options: .regularExpression) != nil { return password }
        if password.range(of: "^[0-9a-fA-F]{32}$", options: .regularExpression) != nil { return String(password.dropFirst(8).prefix(16)) }
        return md5(password).dropFirst(8).prefix(16).description
    }
    static func buildPasswordPacket(password: String, epochSeconds: Int64 = Int64(Date().timeIntervalSince1970)) throws -> Data {
        guard password.range(of: "^[0-9]{6}$", options: .regularExpression) != nil else { throw AppError.invalidPassword }
        let token = passwordToken(password)
        return try encrypt(Data("\(epochSeconds)\(token)A:PW;P:\(token);".utf8))
    }
    static func buildOpenPacket(profile: DeviceProfile, password: String, epochSeconds: Int64 = Int64(Date().timeIntervalSince1970)) throws -> Data {
        guard !password.isEmpty else { throw AppError.invalidPassword }
        let token = passwordToken(password)
        return try encrypt(Data("\(epochSeconds)\(token)A:OPEN;P:\(profile.directionSymbol) \(profile.openTimeMs),\(profile.waitTimeMs),\(profile.closeTimeMs);".utf8))
    }
    static func isSuccess(_ data: Data) -> Bool { let text = responseText(data).uppercased(); return text.contains("OK") || data.hex.uppercased().contains("4F4B") }
    static func isFailure(_ data: Data) -> Bool { let text = responseText(data).uppercased(); return text.contains("ERROR") || text.contains("FAIL") || data.hex.uppercased().contains("4552524F52") }
    static func responseText(_ data: Data) -> String { String(decoding: data, as: UTF8.self).filter { $0 == "\n" || $0 == "\r" || $0 == "\t" || ($0 >= " " && $0 <= "~") }.trimmingCharacters(in: .whitespacesAndNewlines) }
    static func responseSummary(_ data: Data) -> String { data.isEmpty ? "空响应" : (responseText(data).isEmpty ? "HEX \(data.hex)" : responseText(data)) }
    private static func md5(_ value: String) -> String { var digest = [UInt8](repeating: 0, count: Int(CC_MD5_DIGEST_LENGTH)); Array(value.utf8).withUnsafeBytes { _ = CC_MD5($0.baseAddress, CC_LONG(value.utf8.count), &digest) }; return digest.map { String(format: "%02x", $0) }.joined() }
    private static func encrypt(_ input: Data) throws -> Data { var padded = input; padded.append(contentsOf: repeatElement(0, count: (16 - input.count % 16) % 16)); var output = [UInt8](repeating: 0, count: padded.count); var moved = 0; let status = padded.withUnsafeBytes { inputPtr in key.withUnsafeBytes { keyPtr in CCCrypt(CCOperation(kCCEncrypt), CCAlgorithm(kCCAlgorithmAES), CCOptions(kCCOptionECBMode), keyPtr.baseAddress, kCCKeySizeAES128, nil, inputPtr.baseAddress, padded.count, &output, output.count, &moved) } }; guard status == kCCSuccess else { throw AppError.invalidPacket }; return Data(output.prefix(moved)) }
}
private enum CBUUIDString { static let service = "6e400001-b5a3-f393-e0a9-e50e24dcca9e"; static let write = "6e400002-b5a3-f393-e0a9-e50e24dcca9e"; static let notify = "6e400003-b5a3-f393-e0a9-e50e24dcca9e" }
extension Data { var hex: String { map { String(format: "%02X", $0) }.joined() } }
