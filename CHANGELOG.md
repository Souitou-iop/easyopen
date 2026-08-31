# Changelog

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
