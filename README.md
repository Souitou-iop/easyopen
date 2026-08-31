<p align="center">
  <img src="docs/assets/easyopen-icon.png" alt="EasyOpen 图标" width="160" />
</p>

<h1 align="center">EasyOpen</h1>

<p align="center">
  面向 YILA 开门器的本地蓝牙开门工具
</p>

<p align="center">
  <a href="https://github.com/Souitou-iop/easyopen/actions"><img src="https://img.shields.io/github/actions/workflow/status/Souitou-iop/easyopen/android-release.yml?label=build" alt="Build" /></a>
  <a href="https://developer.android.com/"><img src="https://img.shields.io/badge/Android-13%2B-3DDC84.svg" alt="Android 13+" /></a>
  <a href="https://developer.apple.com/ios/"> <img src="https://img.shields.io/badge/iOS-17%2B-0A84FF.svg" alt="iOS 17+" /></a>
  <a href="https://kotlinlang.org/"><img src="https://img.shields.io/badge/Kotlin-2.3.21-7F52FF.svg" alt="Kotlin" /></a>
  <a href="https://creativecommons.org/licenses/by-nc/4.0/"><img src="https://img.shields.io/badge/License-CC%20BY--NC%204.0-blue.svg" alt="CC BY-NC 4.0" /></a>
</p>

> **重要提示**：EasyOpen 会向真实门锁发送开门指令。请只在你拥有或获准控制的设备上使用，并在门锁附近环境安全时测试。备份文件和分享二维码包含设备密码，不要公开上传或提交到 Git。

## 项目是什么

EasyOpen 是一个**本地 BLE 开门工具**，目前包含：

- Android 原生应用：主要使用 Kotlin、Jetpack Compose 和 Android BLE API；
- iOS 原生应用：主要使用 SwiftUI、CoreBluetooth 和 Keychain；
- Web Bluetooth 版本：保留用于实验和本地浏览器测试，已不再作为主要产品维护。

项目不依赖账号、云端、MQTT、网关或远程开门服务。蓝牙连接和开门数据处理都在当前设备上完成。

### 当前边界

- Android 使用设备的蓝牙 MAC 地址连接开门器；
- iOS 使用系统分配的 `CBPeripheral.identifier` 连接，不能直接读取或使用 BLE 底层 MAC；
- iOS 从 Android 配置导入后，需要重新绑定对应的 iOS 蓝牙设备；
- NFC 标签只携带唤起命令，不携带设备密码，也不绑定标签 UID；
- NFC NDEF 内容可以被复制，因此 NFC 标签本身不是防复制安全凭证；
- 未签名 IPA 仅用于构建检查，不能直接安装到普通 iPhone。

## 快速开始

### Android 用户

1. 在 Android 13 或更高版本设备上安装 EasyOpen。
2. 打开蓝牙；首次运行时授予蓝牙扫描、蓝牙连接权限。部分系统还会要求定位权限。
3. 搜索附近的 YILA 开门器。
4. 输入设备的 6 位数字密码完成配对。
5. 在设备设置中确认方向、开启、保持和关闭时长。
6. 回到主页，点击“一键开锁”测试连接。

Android 的 NFC 快捷开锁流程为：

```text
NFC 标签
→ NfcEntryActivity
→ 读取当前保存设备
→ controller.unlock()
→ connectGatt()
→ 写入开锁指令
```

后台碰 NFC 时，Android 使用独立的无界面 NFC 入口，不要求先打开主界面。

### iOS 用户

1. 在 iOS 17 或更高版本设备上安装经过签名的 EasyOpen。
2. 打开蓝牙并授予蓝牙权限。
3. 在“添加开锁器”中扫描 YILA 设备。
4. 输入 6 位数字密码完成配对。
5. 确认设置页显示“已绑定 iOS 蓝牙设备”。
6. 回到主页点击“一键开锁”测试。

iOS 的 NFC 快捷开锁流程为：

```text
NFC / 快捷指令
→ easyopen://unlock
→ 读取当前设备
→ retrievePeripherals / 扫描
→ central.connect()
→ 服务发现和通知初始化
→ 写入开锁指令
```

iOS 从 Android 备份导入设备后，如果显示“未绑定 iOS 蓝牙设备”，请进入设置并使用“重新绑定蓝牙设备”。绑定完成后，后续 NFC 开锁会优先使用保存的 `CBPeripheral.identifier`，不需要每次全量扫描。

## NFC 快捷开锁

### Android 写入标签

在主页的 NFC 功能中写入标签。EasyOpen 使用以下应用专用 MIME 类型：

```text
application/com.juren233.easyopen.unlock
```

记录内容为：

```text
unlock_current=1
```

Android 会通过 `NfcEntryActivity` 接收这类 NDEF 标签。标签不需要与某个 UID 绑定；只要标签内容正确，系统即可唤起 EasyOpen 并尝试开锁。

如果标签已有 NDEF 内容，应用可以选择：

- 覆盖原有内容；
- 保留原有记录，并把 EasyOpen 记录放到第一条。

### iOS 快捷指令

iOS 使用 URL Scheme：

```text
easyopen://unlock
```

也可以指定一个已导入并已绑定的设备：

```text
easyopen://unlock?device=<设备 UUID>
```

在快捷指令中使用“打开 URL”即可。当前 iOS App 内部不会再弹出开锁二次确认，收到 URL 后会直接执行连接和开锁流程。

> iOS 仍可能根据系统版本、设备锁定状态和快捷指令配置显示系统级提示；应用自身无法绕过 iOS 的系统安全策略。

## 配置分享与备份

### 二维码分享

Android 和 iOS 使用兼容的加密分享格式：

```text
EASYOPEN-SHARE:2:<base64url(iv)>.<base64url(ciphertext+tag)>
```

特点：

- AES-GCM 加密并校验完整性；
- 随机 12 字节 IV；
- URL-safe Base64；
- 支持多台设备；
- 包含设备参数和密码。

二维码分享适合在自己的 Android 和 iOS 设备之间迁移配置。由于二维码内容包含密码，只应通过可信渠道传输。

### JSON 备份

当前还兼容 Android v1 明文 JSON 备份，内容包括：

- 当前设备；
- 设备名称和蓝牙 MAC；
- 6 位密码；
- 开门方向和动作时长；
- 电量信息；
- 主题和自动连接设置。

导入 Android JSON 到 iOS 时：

- MAC 作为跨平台逻辑标识保留；
- iOS 不会把 MAC 当成实际蓝牙连接地址；
- iOS 会清除无法跨平台恢复的 `CBPeripheral.identifier`；
- 导入后需要重新绑定 iOS 蓝牙设备；
- 如果本地已有相同 MAC 的设备，会更新配置并保留原有 iOS 蓝牙绑定。

## 构建和测试

### Android

环境要求：

- JDK 17；
- Android SDK 37；
- Android Studio 或可用的 Gradle 环境。

运行单元测试：

```bash
./gradlew --no-daemon --max-workers=2 :app:testDebugUnitTest
```

构建未签名 Debug APK，仅用于本地验证：

```bash
./gradlew --no-daemon --max-workers=2 :app:assembleDebug -PallowUnsigned=true
```

构建正式签名版本：

```bash
./gradlew --no-daemon --max-workers=2 :app:assembleDebug
./gradlew --no-daemon --max-workers=2 :app:assembleRelease
```

正式签名构建需要本地 `keystore.properties`。请根据 [`keystore.properties.example`](keystore.properties.example) 配置，不要提交密钥、密码或 JKS 文件。

输出位置：

```text
app/build/outputs/apk/debug/app-debug.apk
app/build/outputs/apk/release/app-release.apk
```

### iOS

环境要求：

- macOS；
- Xcode；
- iOS SDK 17 或更高版本。

运行模拟器测试：

```bash
xcodebuild \
  -project ios/EasyOpen.xcodeproj \
  -scheme EasyOpen \
  -destination 'platform=iOS Simulator,name=iPhone 17 Pro' \
  CODE_SIGNING_ALLOWED=NO \
  CODE_SIGNING_REQUIRED=NO \
  test
```

构建未签名 IPA：

```bash
OUT="build-unsigned-current"
mkdir -p "$OUT"
xcodebuild \
  -project ios/EasyOpen.xcodeproj \
  -scheme EasyOpen \
  -configuration Release \
  -sdk iphoneos \
  -destination 'generic/platform=iOS' \
  -archivePath "$OUT/EasyOpen.xcarchive" \
  CODE_SIGNING_ALLOWED=NO \
  CODE_SIGNING_REQUIRED=NO \
  archive

mkdir -p "$OUT/Payload"
cp -R "$OUT/EasyOpen.xcarchive/Products/Applications/EasyOpen.app" "$OUT/Payload/"
(cd "$OUT" && zip -qry EasyOpen-unsigned.ipa Payload)
```

未签名 IPA 可以证明工程和包结构能够构建，但不能替代真机验证，也不能直接安装到普通 iPhone。真机验证需要 Apple 签名、合适的开发者配置，以及真实 NFC 标签和 YILA 开门器。

## 代码结构

```text
app/                                      Android 应用
app/src/main/java/com/juren233/easyopen/
  ble/                                    Android BLE 扫描、连接、重试和 GATT 会话
  data/                                   设备配置、持久化和传输格式
  nfc/                                    NDEF 读取、写入和 NFC 命令
  ui/                                     Compose 页面和 UI 组件
ios/                                     iOS Xcode 工程
  EasyOpen/BLE/                           CoreBluetooth 管理和开锁事务
  EasyOpen/Persistence/                   Keychain 与设备配置
  EasyOpen/Protocol/                      协议包构造和响应解析
  EasyOpen/Transfer/                      Android/iOS 分享和备份兼容
web/                                      Web Bluetooth 实验版本
extracted/                                协议研究和逆向分析材料
ARCHITECTURE.md                           Android 架构说明
docs/assets/easyopen-icon.png             README 使用的项目图标
```

### BLE 协议概览

Android、iOS 和 Web 端使用同一组 YILA BLE 服务标识：

```text
Service: 6e400001-b5a3-f393-e0a9-e50e24dcca9e
Write:   6e400002-b5a3-f393-e0a9-e50e24dcca9e
Notify:  6e400003-b5a3-f393-e0a9-e50e24dcca9e
```

开锁请求包含设备动作参数、时间戳和密码派生数据。协议实现位于：

- Android：`app/src/main/java/com/juren233/easyopen/ble/UnlockProtocol.kt`
- iOS：`ios/EasyOpen/Protocol/UnlockProtocol.swift`
- Web：`web/` 中的 BLE 实现

协议解析和数据迁移逻辑应保持为可测试的纯逻辑，页面不应直接操作 GATT 或本地存储。

## Web Bluetooth 版本

Web 版本位于 [`web/`](web/)，适合：

- 支持 Web Bluetooth 的 Android Chrome；
- HTTPS 静态站点；
- `localhost` 本地开发；
- 通过 ADB 隧道在手机上访问电脑本地页面。

本地启动：

```bash
cd web
python3 -m http.server 8765
```

然后打开：

```text
http://localhost:8765/
```

也可以使用单文件版本：

```text
web/easyopen.html
```

Web Bluetooth 受浏览器权限和生命周期限制：

- 无法像 Android 原生应用一样按 MAC 地址自动选择设备；
- 不能保证后台持续运行；
- 页面关闭或浏览器回收后需要重新连接；
- 正式部署建议使用 HTTPS；
- 网页拥有蓝牙 GATT 写入权限，请不要部署到不可信站点。

通过 ADB 在手机本地启动：

```bash
./web/serve-phone.sh
```

使用前确保：

```bash
adb devices
```

设备状态应为 `device`，而不是 `unauthorized` 或 `offline`。

## 安全与隐私

- 密码保存在本地；iOS 使用 Keychain，Android 使用应用本地存储。
- Android v1 JSON 备份是明文，分享前请确认传输渠道可信。
- 加密二维码包含密码，任何拿到二维码的人都可能尝试解密或导入配置。
- NFC 标签只包含开锁命令，不包含密码，但命令内容可复制。
- 项目不提供远程开门、账号系统或云端访问控制。
- 不要把 `keystore.properties`、JKS/keystore、真实备份、设备密码或真机日志提交到公开仓库。
- `extracted/` 主要用于协议研究和兼容性分析，其中的原始材料不当然属于本项目原创内容。

## 贡献和问题反馈

提交 Issue 或 Pull Request 时，请尽量提供：

- 使用的平台和系统版本；
- EasyOpen 版本或 commit；
- 设备型号和 YILA 固件信息；
- 是否已绑定 iOS `CBPeripheral.identifier`；
- 复现步骤和脱敏日志；
- 失败发生在扫描、连接、服务发现、写入还是响应阶段。

请不要上传包含密码、Keychain 内容、完整备份 JSON 或私有设备标识的日志。

## 许可证

除特别注明外，EasyOpen 的原创源代码、文档和原创资源采用 [CC BY-NC 4.0 International](https://creativecommons.org/licenses/by-nc/4.0/) 许可，详见 [`LICENSE`](LICENSE)。

CC BY-NC 4.0 包含非商业使用限制，并不是 OSI 定义的传统软件开源许可证。商业使用或商业分发需要另行取得授权。

AndroidX、Jetpack Compose、Kotlin、Miuix、ZXing 和其他第三方组件仍按各自许可证执行。协议研究材料和 `extracted/` 中的第三方内容不自动适用本项目许可证。
