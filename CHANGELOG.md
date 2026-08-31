# Changelog

## [1.0.4] - 2026-09-01

### Added

- iOS 主页开锁按钮物理按压动画（缩放/下沉/动态阴影）与触感反馈（`UIImpactFeedbackGenerator` 轻触震动与 `sensoryFeedback` 成功/失败震动）。
- iOS 设定页重构为模块化架构：当前设备卡片、设备管理、自动化设置、二维码数据迁移、Keychain 密码安全设置。
- iOS 当前设备开锁方向改为列表行直接点击切换（正向+/反向-），去除弹窗并附带选择触感。

### Changed

- iOS 保护蓝牙已连接就绪状态，防止后台自动连接扫描将状态覆盖为“正在扫描”/“已发现设备”，文案统一显示为“设备已就绪”。
- iOS 限制开锁时长设置范围：保持时长上限改为 10,000 ms，开启与关闭时长上限改为 5,000 ms。
- iOS 电量显示逻辑对齐 Android 规则（1~5 档映射为电量低、约 25%、50%、75%、100%），同步更新主页状态胶囊、设定页及设备详情页。

### Compatibility

- Android 与 iOS 版本号同步递增至 1.0.4 (versionCode: 50)。
- 数据迁移与二维码分享格式保持完全兼容。

### Validation

- iOS 模拟器单元测试：8 项全部通过。
- Android 单元测试：全部通过。
- 未签名 Release IPA 与 Android Release 构建均验证成功。

## [1.0.3] - 2026-08-31

### Added

- iOS Android-compatible JSON backups now preserve the optional `iosPeripheralIdentifier` when available.
- iOS imports restore a saved local peripheral identifier when possible and retain the existing local binding when one already exists.
- iOS reconnect now checks system-connected peripherals before UUID retrieval and scanning.

### Changed

- iOS background NFC auto-unlock keeps a usable GATT session for a 2-second grace period, matching Android's idle release window.
- If NFC does not arrive within 2 seconds, iOS disconnects and releases the BLE channel.
- Returning to the foreground or receiving the NFC URL cancels the pending background release.
- NFC unlock continues to wait for an in-flight foreground reconnect instead of reporting a false operation conflict.

### Compatibility

- Android continues to use the physical Bluetooth MAC address for device selection and `connectGatt()`.
- iOS continues to use `CBPeripheral.identifier` for actual CoreBluetooth connections.
- Existing Android v1 JSON backups without `iosPeripheralIdentifier` remain compatible.
- iOS encrypted compact QR sharing remains on the existing Android-compatible format.

### Validation

- iOS simulator tests: 8 passed.
- Android unit tests: passed.
- Android and iOS release archives: built locally without signing.
- Real NFC, BLE timing, and YILA hardware behavior still require a signed build and physical-device validation.
