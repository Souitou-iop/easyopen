# com.macronum.bledemo / YiLa Door 静态逆向记录

提取时间：2026-08-30
设备包：`com.macronum.bledemo`，versionName `3.2.1`，versionCode `321`
本地 APK SHA-256：`e88fcc1d23d996de68fc68d8579c0c374d76ab19dad7b2cbd334c7254f5c4546`

## 已确认的 BLE 链路

- Service: `6e400001-b5a3-f393-e0a9-e50e24dcca9e`
- Write characteristic: `6e400002-b5a3-f393-e0a9-e50e24dcca9e`
- Notify characteristic: `6e400003-b5a3-f393-e0a9-e50e24dcca9e`
- CCCD: `00002902-0000-1000-8000-00805f9b34fb`
- 连接后请求 connection priority HIGH，并请求 MTU 100；MTU 回调后发现服务。
- 连接服务成功后启用 notify，并写入 `ENABLE_NOTIFICATION_VALUE`；CCCD 缺失/写入失败时原版会兼容性 fallback 为 ready。
- 原版开门写入使用 no-response：Android 33+ 通过 `BluetoothGatt.writeCharacteristic(..., WRITE_TYPE_NO_RESPONSE)`，旧版本设置 characteristic writeType=1 后写入。

## 已确认的开门命令

原版 `C0.f.K(BluetoothDevice)` 生成：

1. `sign = attribute == 1 ? "-" : "+"`
2. `command = "A:OPEN;P:" + sign + " " + openTime + "," + waitTime + "," + closeTime + ";"`
3. `passwordToken`：
   - 16 位十六进制密码：原样使用；
   - 32 位十六进制密码：取下标 `[8,24)`；
   - 其他密码：MD5(UTF-8) 后取十六进制字符串下标 `[8,24)`。
4. 明文：`epochSeconds + passwordToken + command`
5. AES key：`Fx4k6AWivOsLE4NI`（UTF-8，16 bytes）
6. 算法：`AES/ECB/NoPadding`
7. 明文 UTF-8 用零字节填充到 16 的倍数后加密。

原版默认参数来自 `BluetoothDevice.createNewDevice()`：`openTime=650`、`waitTime=2000`、`closeTime=600`、`attribute=0`。

## 已确认的响应解析

通知响应优先按 UTF-8/可打印 ASCII 解释：包含 `OK` 即成功；若 ASCII 不可用，则检查十六进制中是否包含 `4F4B`。包含 `ERROR` 或 `FAIL` 视为失败；无内容是空响应；其他情况为未知响应。

