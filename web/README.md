# EasyOpen Web

这是 EasyOpen 的免安装 Web Bluetooth 版本。它复用了原 `com.macronum.bledemo` 的本地 BLE 协议：

- Service：`6e400001-b5a3-f393-e0a9-e50e24dcca9e`
- Write：`6e400002-b5a3-f393-e0a9-e50e24dcca9e`
- Notify：`6e400003-b5a3-f393-e0a9-e50e24dcca9e`
- 开门命令：时间戳 + 密码派生片段 + `A:OPEN;P:<+|-> <open>,<wait>,<close>;`
- AES：`Fx4k6AWivOsLE4NI`、`AES/ECB/NoPadding`、零填充

## 使用条件

1. 使用支持 Web Bluetooth 的 Android Chrome，或支持该能力的 Chromium 浏览器。
2. 通过 HTTPS 打开页面；本地开发可以使用 `http://localhost`。
3. Linux 桌面 Chrome 还需要在 `chrome://flags/#experimental-web-platform-features` 启用 Experimental Web Platform features，然后重启 Chrome。
4. 点击“选择设备”，在浏览器的设备选择器中选开门器。
5. 输入原版开门器密码，确认参数后点击“开门”。

直接从文件管理器打开 `file://.../index.html` 时，旧版模块脚本可能会被 Chrome 的 file-origin CORS 拦截；当前页面已经改为普通 `defer` 脚本，页面控件可以正常加载，但蓝牙操作仍建议放在 HTTPS 页面中。浏览器也不会把蓝牙 MAC 地址交给网页，因此网页版本不再要求手填 MAC，而是使用用户选择的 `BluetoothDevice` 权限对象。

## 安全边界

- 密码不会写入 localStorage，刷新页面后需要重新输入。
- 不要把此页面部署到不信任的第三方站点；网页拥有蓝牙 GATT 写入权限，也可能读取你输入的密码。
- 本版本只做本地 BLE，不包含原 App 的登录、云端、MQTT、网关和远程开门功能。

## 当前限制

Web Bluetooth 不能像原生 Android 一样自由扫描、按 MAC 自动选择或保证后台常驻；每次连接必须经过浏览器权限模型，页面关闭/浏览器回收后需要重新连接。实际开门仍需在你的真实开门器上做一次用户确认测试。

## 单文件版本

可以直接分发：

```text
项目根目录/web/easyopen.html
```

这个文件已经内嵌 CSS 和 JavaScript，不再依赖同目录下的 `styles.css` 或 `app.js`。如果部署到静态 HTTPS 站点，建议将它改名为 `index.html`，然后用 Android Chrome 打开。

## 不部署到公网：通过 ADB 在手机上本地使用

如果不想部署到任何网站，可以让电脑只在本机启动静态服务器，再通过 ADB 隧道让手机访问电脑的 `localhost`。这不需要公网、域名、云服务或 APK 安装，但手机需要保持 ADB 连接。

电脑端执行：

```bash
./web/serve-phone.sh
```

然后在手机 Chrome 打开：

```text
http://localhost:8765/easyopen.html
```

脚本会执行 `adb reverse`，使手机的 `localhost:8765` 指向电脑本地的网页服务。网页中的 Web Bluetooth 仍然使用手机自己的蓝牙适配器，不会使用电脑蓝牙。手机端选择设备、连接和开门流程与正式网页版本相同。

如果脚本提示没有 ADB 设备，先在电脑执行：

```bash
adb devices
```

确认设备状态是 `device`，不是 `unauthorized` 或 `offline`。
