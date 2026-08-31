import Foundation

enum ConnectionState: Equatable { case unavailable, scanning, discovered, connecting, ready, unlocking, success, disconnected, failure(String) }
enum AppError: LocalizedError, Equatable { case bluetoothUnavailable, deviceNotFound, connectionTimeout, serviceMissing, writeFailed, operationTimeout, invalidPassword, invalidPacket, importFailed, duplicateDevice, operationInProgress
    var errorDescription: String? { switch self { case .bluetoothUnavailable: "蓝牙不可用"; case .deviceNotFound: "未找到开锁器"; case .connectionTimeout: "连接超时"; case .serviceMissing: "设备服务不完整"; case .writeFailed: "蓝牙写入失败"; case .operationTimeout: "设备响应超时"; case .invalidPassword: "密码必须是 6 位数字"; case .invalidPacket: "数据格式无效"; case .importFailed: "导入失败或二维码无效"; case .duplicateDevice: "设备已经存在"; case .operationInProgress: "已有蓝牙操作正在进行" } } }

struct DeviceProfile: Codable, Identifiable, Equatable {
    var id: UUID = UUID()
    var name: String = "我的开门器"
    var peripheralIdentifier: UUID?
    var legacyAddress: String?
    var passwordKeychainID: String = UUID().uuidString
    var attribute: Int = 0
    var openTimeMs: Int = 650
    var waitTimeMs: Int = 2000
    var closeTimeMs: Int = 600
    var batteryLevel: Int?
}

struct PersistedDevice: Codable { var profile: DeviceProfile }

extension DeviceProfile {
    var directionSymbol: String { attribute == 1 ? "-" : "+" }
    var parameterSummary: String { "\(directionSymbol) · \(openTimeMs)/\(waitTimeMs)/\(closeTimeMs) ms" }
}
