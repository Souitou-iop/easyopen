# EasyOpen iOS

SwiftUI/CoreBluetooth 原生 iOS 客户端，最低 iOS 17。

## 当前实现

- 引导页：添加开锁器、扫码导入
- CoreBluetooth：YILA Nordic UART 服务连接、配对、开锁、Notify
- 主页面：状态与一键开锁
- 设定页：多设备、动作参数、Keychain 密码
- Android EasyOpen `EASYOPEN-SHARE:1/2` 分享格式解码与 v2 分享生成
- `easyopen://unlock?device=<UUID>` URL Scheme，可由 iOS 快捷指令 NFC 自动化打开
- Core Image 二维码显示

## 构建

```bash
xcodebuild -project ios/EasyOpen.xcodeproj -scheme EasyOpen \
  -sdk iphonesimulator \
  -destination 'platform=iOS Simulator,name=iPhone 17 Pro' \
  CODE_SIGNING_ALLOWED=NO build
```

模拟器不能验证真实 BLE、NFC 或快捷指令链路；真机测试需要 Apple 签名。
