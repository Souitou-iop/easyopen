package com.juren233.easyopen.ble

import android.Manifest
import android.annotation.SuppressLint
import android.bluetooth.BluetoothAdapter
import android.bluetooth.BluetoothDevice
import android.bluetooth.BluetoothGatt
import android.bluetooth.BluetoothGattCallback
import android.bluetooth.BluetoothGattCharacteristic
import android.bluetooth.BluetoothGattDescriptor
import android.bluetooth.BluetoothManager
import android.bluetooth.BluetoothProfile
import android.bluetooth.BluetoothStatusCodes
import android.bluetooth.le.BluetoothLeScanner
import android.bluetooth.le.ScanCallback
import android.bluetooth.le.ScanResult
import android.bluetooth.le.ScanSettings
import android.content.Context
import android.content.pm.PackageManager
import android.os.Build
import android.os.Handler
import android.os.Looper
import android.util.Log
import androidx.core.content.ContextCompat
import com.juren233.easyopen.BuildConfig
import com.juren233.easyopen.R
import com.juren233.easyopen.data.AutoConnectSettings
import com.juren233.easyopen.data.DeviceProfile
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.update
import java.util.UUID

sealed interface BleState {
    data object Idle : BleState
    data object Scanning : BleState
    data class Connecting(val address: String) : BleState
    data class Pairing(val address: String) : BleState
    data class Ready(val address: String) : BleState
    data class Unlocking(val address: String) : BleState
    data class Paired(val address: String) : BleState
    data class Success(val message: String) : BleState
    data class Error(val message: String) : BleState
}

data class DiscoveredDevice(
    val device: BluetoothDevice,
    val name: String,
    val rssi: Int,
    val likelyYiLa: Boolean = true,
)

/** BLE controller for the Nordic UART-compatible YiLa/Macronum opener. */
class BleDoorController(context: Context) {
    companion object {
        private const val TAG = "BleDoorController"
        val SERVICE_UUID: UUID = UUID.fromString("6e400001-b5a3-f393-e0a9-e50e24dcca9e")
        val WRITE_UUID: UUID = UUID.fromString("6e400002-b5a3-f393-e0a9-e50e24dcca9e")
        val NOTIFY_UUID: UUID = UUID.fromString("6e400003-b5a3-f393-e0a9-e50e24dcca9e")
        val CCCD_UUID: UUID = UUID.fromString("00002902-0000-1000-8000-00805f9b34fb")
        private const val MAX_WRITE_RETRIES = 8
        private const val WRITE_RETRY_DELAY_MS = 200L
        private const val DISCOVERY_SCAN_WINDOW_MS = 12_000L
        private const val SCAN_RESTART_DELAY_MS = 350L
        private const val PRESENCE_SCAN_WINDOW_MS = 8_000L
        private const val GATT_CONNECTION_TIMEOUT_MS = 8_000L

        /** The original app accepts local openers whose advertised name contains YILA, except remotes. */
        fun isYiLaOpenerName(name: String): Boolean {
            val normalized = name.trim().uppercase()
            return normalized.contains("YILA") && !normalized.contains("REMOTE")
        }
    }

    private fun text(resourceId: Int, vararg formatArgs: Any): String =
        appContext.getString(resourceId, *formatArgs)

    private val appContext = context.applicationContext
    private val bluetoothManager = appContext.getSystemService(BluetoothManager::class.java)
    private val adapter: BluetoothAdapter?
        get() = bluetoothManager?.adapter
    private val mainHandler = Handler(Looper.getMainLooper())

    private val _state = MutableStateFlow<BleState>(BleState.Idle)
    val state: StateFlow<BleState> = _state.asStateFlow()
    private val _connectionState = MutableStateFlow<BleConnectionState>(BleConnectionState.Disconnected)
    val connectionState: StateFlow<BleConnectionState> = _connectionState.asStateFlow()
    private val _devices = MutableStateFlow<List<DiscoveredDevice>>(emptyList())
    val devices: StateFlow<List<DiscoveredDevice>> = _devices.asStateFlow()
    private val _batteryLevels = MutableStateFlow<Map<String, Int>>(emptyMap())
    val batteryLevels: StateFlow<Map<String, Int>> = _batteryLevels.asStateFlow()
    private val _openerConnection = MutableStateFlow(OpenerConnectionSnapshot())
    /** Four-state availability/link status for the active opener shown on the home page. */
    val openerConnection: StateFlow<OpenerConnectionSnapshot> = _openerConnection.asStateFlow()

    private var scannerCallback: ScanCallback? = null
    private var discoveryScanActive = false
    private var discoveryScanRestart: Runnable? = null
    private var discoveryScanWindow: Runnable? = null
    private var presenceScannerCallback: ScanCallback? = null
    private var presenceScanRestart: Runnable? = null
    private var presenceScanWindow: Runnable? = null
    private var presenceMonitoringActive = false
    private var presenceProfile: DeviceProfile? = null
    private var presenceLockedAddress: String? = null
    private var presenceLastRssi: Int? = null
    private var presenceLastSeenAtMs: Long = 0L
    private var presenceWindowHadTarget = false
    private var presenceAutoConnectEnabled = true
    private var presenceAutoConnectRssiThreshold = OpenerConnectionPolicy.AUTO_CONNECT_RSSI_THRESHOLD
    private var presenceWindowId = 0
    private var lastAutoConnectAttemptAtMs = 0L
    private var batteryScannerCallback: ScanCallback? = null
    private var batteryScanRestart: Runnable? = null
    private var batteryScanActive = false
    private var batteryScanDurationMs = 12_000L
    private var batteryScanTargetAddress: String? = null
    private val batteryDiagnosticSignatures = LinkedHashSet<String>()
    private var batteryScanWindowIndex = 0
    private var batteryWindowResultCount = 0
    private var batteryWindowTargetCount = 0
    private var batteryWindowExactAddressCount = 0
    private var batteryWindowValidLevelCount = 0
    private var gatt: BluetoothGatt? = null
    private var writeCharacteristic: BluetoothGattCharacteristic? = null
    private var notifyCharacteristic: BluetoothGattCharacteristic? = null
    private var currentAddress: String? = null
    private var pendingOperation: PendingOperation = PendingOperation.None
    private var operationTimeout: Runnable? = null
    private var connectionTimeout: Runnable? = null
    private var writeRetry: Runnable? = null
    private var writeRetryCount = 0
    private var descriptorRetry: Runnable? = null
    private var descriptorRetryCount = 0

    private sealed interface PendingOperation {
        data object None : PendingOperation
        data class Pairing(val password: String) : PendingOperation
        data class Unlock(val profile: DeviceProfile) : PendingOperation
    }

    fun hasBluetoothPermission(): Boolean = if (Build.VERSION.SDK_INT >= 31) {
        ContextCompat.checkSelfPermission(appContext, Manifest.permission.BLUETOOTH_CONNECT) == PackageManager.PERMISSION_GRANTED &&
            ContextCompat.checkSelfPermission(appContext, Manifest.permission.BLUETOOTH_SCAN) == PackageManager.PERMISSION_GRANTED &&
            ContextCompat.checkSelfPermission(appContext, Manifest.permission.ACCESS_FINE_LOCATION) == PackageManager.PERMISSION_GRANTED &&
            ContextCompat.checkSelfPermission(appContext, Manifest.permission.ACCESS_COARSE_LOCATION) == PackageManager.PERMISSION_GRANTED
    } else {
        ContextCompat.checkSelfPermission(appContext, Manifest.permission.ACCESS_FINE_LOCATION) == PackageManager.PERMISSION_GRANTED
    }

    fun isBluetoothEnabled(): Boolean = adapter?.isEnabled == true

    @SuppressLint("MissingPermission")
    fun startScan() {
        if (!hasBluetoothPermission()) {
            _state.value = BleState.Error(text(R.string.error_bluetooth_permission))
            return
        }
        if (!isBluetoothEnabled()) {
            _state.value = BleState.Error(text(R.string.error_bluetooth_disabled))
            return
        }
        val bleScanner = adapter?.bluetoothLeScanner
        if (bleScanner == null) {
            _state.value = BleState.Error(text(R.string.error_scanner_unavailable))
            return
        }

        discoveryScanActive = true
        discoveryScanRestart?.let(mainHandler::removeCallbacks)
        discoveryScanRestart = null
        stopDiscoveryScanWindow()
        _devices.value = emptyList()
        startDiscoveryScanWindow(bleScanner)
    }

    @SuppressLint("MissingPermission")
    private fun startDiscoveryScanWindow(bleScanner: BluetoothLeScanner) {
        if (!discoveryScanActive) return
        stopDiscoveryScanWindow()
        val callback = object : ScanCallback() {
            override fun onScanResult(callbackType: Int, result: ScanResult) {
                val device = result.device ?: return
                val advertisedName = advertisedName(device, result)
                // Match the original local-device path: advertised name contains YILA and excludes REMOTE.
                if (!isYiLaOpenerName(advertisedName)) return

                updateBatteryLevel(device.address, result.scanRecord?.bytes)
                val next = DiscoveredDevice(
                    device = device,
                    name = advertisedName.trim().ifBlank { text(R.string.default_opener_advertised_name) },
                    rssi = result.rssi,
                )
                _devices.value = (_devices.value
                    .filterNot { it.device.address.equals(device.address, ignoreCase = true) } + next)
                    .sortedByDescending(DiscoveredDevice::rssi)
            }

            override fun onScanFailed(errorCode: Int) {
                if (scannerCallback === this) {
                    scannerCallback = null
                    // Discovery is deliberately self-healing. A temporary platform scan
                    // error must not strand the pairing page in an error state.
                    scheduleDiscoveryScanRestart()
                }
            }
        }
        scannerCallback = callback
        _state.value = BleState.Scanning
        runCatching {
            // The original app starts an unfiltered low-latency scan and filters the advertised name in its callback.
            bleScanner.startScan(
                null,
                ScanSettings.Builder()
                    .setScanMode(ScanSettings.SCAN_MODE_LOW_LATENCY)
                    .setCallbackType(ScanSettings.CALLBACK_TYPE_ALL_MATCHES)
                    .setMatchMode(ScanSettings.MATCH_MODE_AGGRESSIVE)
                    .setNumOfMatches(ScanSettings.MATCH_NUM_MAX_ADVERTISEMENT)
                    .setReportDelay(0L)
                    .build(),
                callback,
            )
        }.onFailure {
            if (BuildConfig.DEBUG) Log.w(TAG, "discovery scan start failed: ${it.message}")
            if (scannerCallback === callback) scannerCallback = null
            scheduleDiscoveryScanRestart()
        }
        discoveryScanWindow = Runnable {
            if (scannerCallback === callback) {
                stopDiscoveryScanWindow()
                scheduleDiscoveryScanRestart()
            }
        }.also { mainHandler.postDelayed(it, DISCOVERY_SCAN_WINDOW_MS) }
    }

    private fun scheduleDiscoveryScanRestart() {
        if (!discoveryScanActive || discoveryScanRestart != null) return
        discoveryScanRestart = Runnable {
            discoveryScanRestart = null
            if (!discoveryScanActive || !hasBluetoothPermission() || !isBluetoothEnabled()) return@Runnable
            adapter?.bluetoothLeScanner?.let(::startDiscoveryScanWindow)
        }.also { mainHandler.postDelayed(it, SCAN_RESTART_DELAY_MS) }
    }

    @SuppressLint("MissingPermission")
    private fun stopDiscoveryScanWindow() {
        discoveryScanWindow?.let(mainHandler::removeCallbacks)
        discoveryScanWindow = null
        val callback = scannerCallback ?: return
        runCatching { adapter?.bluetoothLeScanner?.stopScan(callback) }
        scannerCallback = null
    }

    @SuppressLint("MissingPermission")
    private fun advertisedName(device: BluetoothDevice, result: ScanResult): String {
        return runCatching { device.name.orEmpty() }.getOrDefault("")
            .ifBlank { AdvertisementNameParser.parse(result.scanRecord?.bytes).orEmpty() }
            .ifBlank { result.scanRecord?.deviceName.orEmpty() }
    }

    /**
     * Keeps looking for the active opener while the home page is visible.
     *
     * The opener stops advertising while another phone owns the GATT link, so a
     * failed/expired scan is not an error. We keep the monitor alive and let the
     * next scan window decide whether the device is still discoverable.
     */
    @SuppressLint("MissingPermission")
    fun startOpenerMonitoring(
        profile: DeviceProfile,
        autoConnectEnabled: Boolean = true,
        autoConnectRssiThreshold: Int = OpenerConnectionPolicy.AUTO_CONNECT_RSSI_THRESHOLD,
    ) {
        val address = profile.address.trim().uppercase()
        stopScan()
        stopBatteryScan()
        stopPresenceScanWindow()
        presenceScanRestart?.let(mainHandler::removeCallbacks)
        presenceScanRestart = null
        presenceMonitoringActive = address.isNotBlank() && BluetoothAdapter.checkBluetoothAddress(address)
        presenceProfile = profile
        presenceLockedAddress = address.takeIf(BluetoothAdapter::checkBluetoothAddress)
        presenceLastRssi = null
        presenceLastSeenAtMs = 0L
        presenceWindowHadTarget = false
        presenceAutoConnectEnabled = autoConnectEnabled
        presenceAutoConnectRssiThreshold = AutoConnectSettings.normalizeRssiThreshold(autoConnectRssiThreshold)
        lastAutoConnectAttemptAtMs = 0L

        val link = _connectionState.value
        when {
            link is BleConnectionState.Connected && link.address.equals(address, ignoreCase = true) -> {
                publishOpenerConnection(OpenerConnectionStatus.CONNECTED, address)
                return
            }
            link is BleConnectionState.Connecting && link.address.equals(address, ignoreCase = true) -> {
                publishOpenerConnection(OpenerConnectionStatus.CONNECTING, address)
                return
            }
            !presenceMonitoringActive -> {
                publishOpenerConnection(OpenerConnectionStatus.NOT_FOUND, address)
                return
            }
            else -> {
                // A user-selected profile may differ from the old active link.
                // Release the old link before waiting for the new opener's signal.
                closeCurrentLinkForDifferentAddress(address)
                publishOpenerConnection(OpenerConnectionStatus.NOT_FOUND, address)
                startPresenceScanWindow()
            }
        }
    }

    @SuppressLint("MissingPermission")
    fun stopOpenerMonitoring() {
        presenceMonitoringActive = false
        if (pendingOperation is PendingOperation.None && _connectionState.value is BleConnectionState.Connecting) {
            cancelConnectionTimeout()
            runCatching { gatt?.disconnect() }
            closeGatt()
            _connectionState.value = BleConnectionState.Disconnected
            _state.value = BleState.Idle
        }
        presenceProfile = null
        presenceLockedAddress = null
        presenceLastRssi = null
        presenceLastSeenAtMs = 0L
        presenceWindowHadTarget = false
        presenceAutoConnectEnabled = true
        presenceAutoConnectRssiThreshold = OpenerConnectionPolicy.AUTO_CONNECT_RSSI_THRESHOLD
        presenceScanRestart?.let(mainHandler::removeCallbacks)
        presenceScanRestart = null
        stopPresenceScanWindow()
        _openerConnection.value = OpenerConnectionSnapshot()
    }

    @SuppressLint("MissingPermission")
    private fun startPresenceScanWindow() {
        if (!presenceMonitoringActive || !hasBluetoothPermission() || !isBluetoothEnabled()) {
            if (presenceMonitoringActive) {
                val address = presenceProfile?.address.orEmpty().uppercase()
                publishOpenerConnection(OpenerConnectionStatus.NOT_FOUND, address)
                schedulePresenceScanRestart()
            }
            return
        }
        val bleScanner = adapter?.bluetoothLeScanner ?: run {
            publishOpenerConnection(
                OpenerConnectionStatus.NOT_FOUND,
                presenceProfile?.address.orEmpty().uppercase(),
            )
            schedulePresenceScanRestart()
            return
        }
        stopPresenceScanWindow()
        presenceWindowHadTarget = false
        val windowId = ++presenceWindowId
        val callback = object : ScanCallback() {
            override fun onScanResult(callbackType: Int, result: ScanResult) {
                if (presenceScannerCallback === this) consumePresenceScanResult(windowId, result)
            }

            override fun onBatchScanResults(results: MutableList<ScanResult>) {
                if (presenceScannerCallback === this) {
                    results.forEach { consumePresenceScanResult(windowId, it) }
                }
            }

            override fun onScanFailed(errorCode: Int) {
                if (BuildConfig.DEBUG) {
                    Log.w(TAG, "opener presence scan failed window=$windowId errorCode=$errorCode")
                }
                if (presenceScannerCallback === this) {
                    presenceScannerCallback = null
                    schedulePresenceScanRestart()
                }
            }
        }
        presenceScannerCallback = callback
        runCatching {
            bleScanner.startScan(
                null,
                ScanSettings.Builder()
                    .setScanMode(ScanSettings.SCAN_MODE_LOW_LATENCY)
                    .setCallbackType(ScanSettings.CALLBACK_TYPE_ALL_MATCHES)
                    .setMatchMode(ScanSettings.MATCH_MODE_AGGRESSIVE)
                    .setNumOfMatches(ScanSettings.MATCH_NUM_MAX_ADVERTISEMENT)
                    .setReportDelay(0L)
                    .build(),
                callback,
            )
        }.onFailure {
            if (BuildConfig.DEBUG) {
                Log.w(TAG, "opener presence scan start failed window=$windowId: ${it.message}")
            }
            if (presenceScannerCallback === callback) presenceScannerCallback = null
            schedulePresenceScanRestart()
        }
        presenceScanWindow = Runnable {
            if (presenceScannerCallback !== callback) return@Runnable
            val address = presenceProfile?.address.orEmpty().uppercase()
            val connected = _connectionState.value is BleConnectionState.Connected &&
                (_connectionState.value as BleConnectionState.Connected).address.equals(address, ignoreCase = true)
            val signalFresh = OpenerConnectionPolicy.isSignalFresh(presenceLastSeenAtMs, System.currentTimeMillis())
            if (!connected && !signalFresh) {
                publishOpenerConnection(OpenerConnectionStatus.NOT_FOUND, address)
            }
            if (BuildConfig.DEBUG) {
                Log.d(
                    TAG,
                    "opener presence window=$windowId finished targetSeen=$presenceWindowHadTarget " +
                        "signalFresh=$signalFresh rssi=${presenceLastRssi ?: "unknown"} " +
                        "status=${_openerConnection.value.status}",
                )
            }
            stopPresenceScanWindow()
            schedulePresenceScanRestart()
        }.also { mainHandler.postDelayed(it, PRESENCE_SCAN_WINDOW_MS) }
    }

    @SuppressLint("MissingPermission")
    private fun consumePresenceScanResult(windowId: Int, result: ScanResult) {
        val profile = presenceProfile ?: return
        val device = result.device ?: return
        val address = device.address.trim().uppercase()
        val targetAddress = presenceLockedAddress ?: profile.address.trim().uppercase()
        // Once the active profile is known, only its address can claim the lock.
        // Name/service matches are useful for pairing, but are not safe for an
        // already-paired home device when several openers are nearby.
        if (!address.equals(targetAddress, ignoreCase = true)) return

        val rssi = result.rssi
        if (BuildConfig.DEBUG) {
            Log.d(TAG, "opener presence result window=$windowId address=$address rssi=$rssi")
        }
        presenceWindowHadTarget = true
        presenceLastRssi = rssi
        presenceLastSeenAtMs = System.currentTimeMillis()
        updateBatteryLevel(address, result.scanRecord?.bytes)
        publishOpenerConnection(OpenerConnectionStatus.DISCOVERED, targetAddress, rssi)
        if (presenceAutoConnectEnabled &&
            OpenerConnectionPolicy.shouldAutoConnect(rssi, presenceAutoConnectRssiThreshold) &&
            canAutoConnect(profile)
        ) {
            lastAutoConnectAttemptAtMs = System.currentTimeMillis()
            if (BuildConfig.DEBUG) {
                Log.d(
                    TAG,
                    "opener presence eligible window=$windowId address=$address rssi=$rssi " +
                        "threshold=$presenceAutoConnectRssiThreshold autoConnectEnabled=$presenceAutoConnectEnabled",
                )
            }
            connectAddress(profile.address)
        }
    }

    private fun canAutoConnect(profile: DeviceProfile): Boolean {
        val targetAddress = profile.address.trim().uppercase()
        val link = _connectionState.value
        if (link is BleConnectionState.Connected && link.address.equals(targetAddress, ignoreCase = true)) return false
        if (link is BleConnectionState.Connecting) return false
        if (System.currentTimeMillis() - lastAutoConnectAttemptAtMs < OpenerConnectionPolicy.AUTO_CONNECT_RETRY_COOLDOWN_MS) {
            return false
        }
        return pendingOperation is PendingOperation.None && currentAddress == null
    }

    private fun schedulePresenceScanRestart() {
        if (!presenceMonitoringActive || presenceScanRestart != null) return
        presenceScanRestart = Runnable {
            presenceScanRestart = null
            if (presenceMonitoringActive) startPresenceScanWindow()
        }.also { mainHandler.postDelayed(it, SCAN_RESTART_DELAY_MS) }
    }

    @SuppressLint("MissingPermission")
    private fun stopPresenceScanWindow() {
        presenceScanWindow?.let(mainHandler::removeCallbacks)
        presenceScanWindow = null
        val callback = presenceScannerCallback ?: return
        runCatching { adapter?.bluetoothLeScanner?.stopScan(callback) }
        presenceScannerCallback = null
    }

    private fun publishOpenerConnection(
        status: OpenerConnectionStatus,
        address: String,
        rssi: Int? = presenceLastRssi,
    ) {
        _openerConnection.value = OpenerConnectionSnapshot(
            status = status,
            address = address.trim().uppercase(),
            rssi = rssi,
        )
    }

    @SuppressLint("MissingPermission")
    private fun closeCurrentLinkForDifferentAddress(address: String) {
        val current = currentAddress
        if (current.isNullOrBlank() || current.equals(address, ignoreCase = true)) return
        runCatching { gatt?.disconnect() }
        cancelOperationTimeout()
        cancelConnectionTimeout()
        pendingOperation = PendingOperation.None
        closeGatt()
        _connectionState.value = BleConnectionState.Disconnected
    }

    private fun restorePresenceAfterLinkFailure(address: String) {
        if (!presenceMonitoringActive || !presenceProfile?.address.equals(address, ignoreCase = true)) return
        val now = System.currentTimeMillis()
        if (presenceLastRssi != null && OpenerConnectionPolicy.isSignalFresh(presenceLastSeenAtMs, now)) {
            publishOpenerConnection(OpenerConnectionStatus.DISCOVERED, address, presenceLastRssi)
        } else {
            publishOpenerConnection(OpenerConnectionStatus.NOT_FOUND, address)
        }
        schedulePresenceScanRestart()
    }

    @SuppressLint("MissingPermission")
    fun startBatteryScan(address: String? = null, durationMs: Long = 12_000L) {
        if (!hasBluetoothPermission() || !isBluetoothEnabled()) return
        val bleScanner = adapter?.bluetoothLeScanner ?: return
        batteryScanTargetAddress = address?.trim()?.uppercase()?.takeIf(BluetoothAdapter::checkBluetoothAddress)
        batteryScanDurationMs = durationMs.coerceAtLeast(1_000L)
        batteryDiagnosticSignatures.clear()
        if (BuildConfig.DEBUG) {
            Log.d(TAG, "start battery scan target=${batteryScanTargetAddress ?: "any YiLa opener"} durationMs=$batteryScanDurationMs")
        }
        batteryScanActive = true
        batteryScanRestart?.let(mainHandler::removeCallbacks)
        batteryScanRestart = null
        startBatteryScanWindow(bleScanner)
    }

    @SuppressLint("MissingPermission")
    private fun startBatteryScanWindow(bleScanner: BluetoothLeScanner) {
        if (!batteryScanActive) return
        stopBatteryScanWindow()
        val windowId = ++batteryScanWindowIndex
        batteryWindowResultCount = 0
        batteryWindowTargetCount = 0
        batteryWindowExactAddressCount = 0
        batteryWindowValidLevelCount = 0
        val callback = object : ScanCallback() {
            override fun onScanResult(callbackType: Int, result: ScanResult) {
                batteryWindowResultCount += 1
                consumeBatteryScanResult(windowId, result)
            }

            override fun onBatchScanResults(results: MutableList<ScanResult>) {
                batteryWindowResultCount += results.size
                results.forEach { consumeBatteryScanResult(windowId, it) }
            }

            override fun onScanFailed(errorCode: Int) {
                // Battery is optional; keep the connection state independent from scan failures.
                if (BuildConfig.DEBUG) {
                    Log.w(
                        TAG,
                        "battery scan failed window=$windowId errorCode=$errorCode " +
                            "results=$batteryWindowResultCount targetHits=$batteryWindowTargetCount " +
                            "exactAddressHits=$batteryWindowExactAddressCount validLevels=$batteryWindowValidLevelCount " +
                            "target=${batteryScanTargetAddress ?: "any YiLa opener"}",
                    )
                }
                if (batteryScannerCallback === this) {
                    batteryScannerCallback = null
                    scheduleBatteryScanRestart()
                }
            }
        }
        batteryScannerCallback = callback
        val settingsBuilder = ScanSettings.Builder()
            .setScanMode(ScanSettings.SCAN_MODE_LOW_LATENCY)
        runCatching {
            // Match the original app's scanner: every advertisement, aggressive matching,
            // and no report delay. This matters on HyperOS where the default callback-only
            // overload is tracked as scanMode=0 and may not deliver the opener advertisement.
            settingsBuilder
                .setCallbackType(ScanSettings.CALLBACK_TYPE_ALL_MATCHES)
                .setMatchMode(ScanSettings.MATCH_MODE_AGGRESSIVE)
                .setNumOfMatches(ScanSettings.MATCH_NUM_MAX_ADVERTISEMENT)
                .setReportDelay(0L)
        }
        val settings = settingsBuilder.build()
        runCatching { bleScanner.startScan(null, settings, callback) }.onFailure {
            if (BuildConfig.DEBUG) {
                Log.w(TAG, "battery scan start failed window=$windowId: ${it.message}")
            }
            if (batteryScannerCallback === callback) batteryScannerCallback = null
            scheduleBatteryScanRestart()
        }
        mainHandler.postDelayed({
            if (batteryScannerCallback === callback) {
                if (BuildConfig.DEBUG) {
                    Log.d(
                        TAG,
                        "battery scan window=$windowId finished results=$batteryWindowResultCount " +
                            "targetHits=$batteryWindowTargetCount exactAddressHits=$batteryWindowExactAddressCount " +
                            "validLevels=$batteryWindowValidLevelCount",
                    )
                }
                stopBatteryScanWindow()
                scheduleBatteryScanRestart()
            }
        }, batteryScanDurationMs)
    }

    @SuppressLint("MissingPermission")
    private fun consumeBatteryScanResult(windowId: Int, result: ScanResult) {
        val device = result.device ?: return
        val address = device.address.trim().uppercase()
        val targetAddress = batteryScanTargetAddress
        val name = advertisedName(device, result)
        val rawRecord = result.scanRecord?.bytes
        val serviceMatch = result.scanRecord?.serviceUuids?.any { it.uuid == SERVICE_UUID } == true
        val match = BatteryScanMatcher.match(
            address = address,
            targetAddress = targetAddress,
            advertisedName = name,
            hasNordicUartService = serviceMatch,
        )
        logBatteryScanResult(windowId, address, name, rawRecord, match)
        if (!match.isTarget) return
        batteryWindowTargetCount += 1
        if (match.addressMatches) batteryWindowExactAddressCount += 1
        val logicalAddress = if (match.addressMatches) {
            targetAddress ?: address
        } else {
            // A privacy address/name update can arrive under a different address. Only
            // alias a candidate when it also advertises the opener's Nordic UART service.
            targetAddress?.takeIf { match.nameMatches && match.serviceMatches } ?: address
        }
        if (updateBatteryLevel(logicalAddress, rawRecord)) {
            batteryWindowValidLevelCount += 1
        }
    }

    private fun logBatteryScanResult(
        windowId: Int,
        address: String,
        name: String,
        rawRecord: ByteArray?,
        match: BatteryScanMatch,
    ) {
        if (!BuildConfig.DEBUG) return
        val targetSpecific = match.isTarget || match.addressMatches
        if (!targetSpecific && batteryDiagnosticSignatures.size >= 32) return
        val rawHex = rawRecord?.take(64)?.joinToString("") { "%02X".format(it.toInt() and 0xFF) } ?: "<none>"
        val signature = if (targetSpecific) {
            "$windowId|$address|$rawHex"
        } else {
            "$address|$rawHex"
        }
        if (!batteryDiagnosticSignatures.add(signature)) return
        Log.d(
            TAG,
            "battery scan result window=$windowId address=$address name=${name.ifBlank { "<none>" }} " +
                "addressMatch=${match.addressMatches} nameMatch=${match.nameMatches} " +
                "serviceMatch=${match.serviceMatches} level=${BatteryAdvertisementParser.parse(rawRecord) ?: "unknown"} raw=$rawHex",
        )
    }

    private fun updateBatteryLevel(address: String, scanRecord: ByteArray?): Boolean {
        val level = BatteryAdvertisementParser.parse(scanRecord) ?: return false
        val normalizedAddress = address.trim().uppercase()
        _batteryLevels.update { current ->
            if (current[normalizedAddress] == level) current else current + (normalizedAddress to level)
        }
        return true
    }

    fun restoreBatteryLevels(profiles: List<DeviceProfile>) {
        val restored = profiles.mapNotNull { profile ->
            profile.batteryLevel?.takeIf { it in 1..5 }?.let {
                profile.address.trim().uppercase() to it
            }
        }.toMap()
        if (restored.isEmpty()) return
        _batteryLevels.update { current -> restored + current }
    }

    private fun scheduleBatteryScanRestart() {
        if (!batteryScanActive || batteryScanRestart != null) return
        batteryScanRestart = Runnable {
            batteryScanRestart = null
            if (!batteryScanActive || !hasBluetoothPermission() || !isBluetoothEnabled()) return@Runnable
            adapter?.bluetoothLeScanner?.let(::startBatteryScanWindow)
        }.also { mainHandler.postDelayed(it, 350L) }
    }

    @SuppressLint("MissingPermission")
    private fun stopBatteryScanWindow() {
        val callback = batteryScannerCallback ?: return
        runCatching { adapter?.bluetoothLeScanner?.stopScan(callback) }
        batteryScannerCallback = null
    }

    @SuppressLint("MissingPermission")
    fun stopBatteryScan() {
        batteryScanActive = false
        batteryScanTargetAddress = null
        batteryScanRestart?.let(mainHandler::removeCallbacks)
        batteryScanRestart = null
        stopBatteryScanWindow()
    }

    @SuppressLint("MissingPermission")
    fun stopScan() {
        discoveryScanActive = false
        discoveryScanRestart?.let(mainHandler::removeCallbacks)
        discoveryScanRestart = null
        stopDiscoveryScanWindow()
        if (_state.value == BleState.Scanning) _state.value = BleState.Idle
    }

    /** Starts the original six-digit password initialization command, without opening the lock. */
    @SuppressLint("MissingPermission")
    fun pair(device: DiscoveredDevice, password: String) {
        val normalizedPassword = password.trim()
        if (!normalizedPassword.matches(Regex("^[0-9]{6}$"))) {
            _state.value = BleState.Error(text(com.juren233.easyopen.R.string.error_password_length))
            return
        }
        cancelOperationTimeout()
        cancelWriteRetry()
        cancelDescriptorRetry()
        pendingOperation = PendingOperation.Pairing(normalizedPassword)
        connectAddress(device.device.address)
    }

    @SuppressLint("MissingPermission")
    fun connect(profile: DeviceProfile) {
        ensureConnected(profile)
    }

    /** Reconnects only when the requested opener is not already connected or connecting. */
    @SuppressLint("MissingPermission")
    fun ensureConnected(profile: DeviceProfile) {
        val address = profile.address.trim().uppercase()
        val link = _connectionState.value
        if (link is BleConnectionState.Connected && link.address.equals(address, ignoreCase = true)) {
            publishOpenerConnection(OpenerConnectionStatus.CONNECTED, address)
            return
        }
        if (link is BleConnectionState.Connecting && link.address.equals(address, ignoreCase = true)) {
            publishOpenerConnection(OpenerConnectionStatus.CONNECTING, address)
            return
        }
        pendingOperation = PendingOperation.None
        connectAddress(address)
    }

    fun isConnected(address: String): Boolean =
        (_connectionState.value as? BleConnectionState.Connected)?.address.equals(address.trim(), ignoreCase = true)

    /** Compatibility entry point used by navigation; the monitor now owns home auto-connect. */
    @SuppressLint("MissingPermission")
    fun prepareHomeConnection(profile: DeviceProfile, probeDelayMs: Long = 0L) {
        startOpenerMonitoring(profile)
    }

    @SuppressLint("MissingPermission")
    private fun connectAddress(address: String) {
        if (!hasBluetoothPermission()) {
            _state.value = BleState.Error(text(R.string.error_bluetooth_permission))
            return
        }
        if (!isBluetoothEnabled()) {
            _state.value = BleState.Error(text(R.string.error_bluetooth_disabled))
            return
        }
        val normalizedAddress = address.trim().uppercase()
        if (!BluetoothAdapter.checkBluetoothAddress(normalizedAddress)) {
            _state.value = BleState.Error(text(R.string.error_address_invalid))
            return
        }
        stopScan()
        presenceScanRestart?.let(mainHandler::removeCallbacks)
        presenceScanRestart = null
        stopPresenceScanWindow()
        stopBatteryScanWindow()
        cancelOperationTimeout()
        cancelConnectionTimeout()
        _connectionState.value = BleConnectionState.Disconnected
        closeGatt()
        val remote = runCatching { adapter?.getRemoteDevice(normalizedAddress) }.getOrNull()
        if (remote == null) {
            _state.value = BleState.Error(text(R.string.error_device_not_found, normalizedAddress))
            restorePresenceAfterLinkFailure(normalizedAddress)
            return
        }
        currentAddress = normalizedAddress
        _connectionState.value = BleConnectionState.Connecting(normalizedAddress)
        if (presenceMonitoringActive && presenceProfile?.address.equals(normalizedAddress, ignoreCase = true)) {
            publishOpenerConnection(OpenerConnectionStatus.CONNECTING, normalizedAddress)
        }
        _state.value = if (pendingOperation is PendingOperation.Pairing) {
            BleState.Pairing(normalizedAddress)
        } else {
            BleState.Connecting(normalizedAddress)
        }
        gatt = runCatching {
            if (Build.VERSION.SDK_INT >= 23) {
                remote.connectGatt(appContext, false, callback, BluetoothDevice.TRANSPORT_LE)
            } else {
                remote.connectGatt(appContext, false, callback)
            }
        }.getOrNull()
        if (gatt == null) {
            _connectionState.value = BleConnectionState.Disconnected
            _state.value = if (pendingOperation is PendingOperation.Pairing) {
                BleState.Error(text(R.string.error_pairing_connection_timeout))
            } else {
                BleState.Error(text(R.string.error_connection_timeout))
            }
            restorePresenceAfterLinkFailure(normalizedAddress)
            return
        }
        connectionTimeout = Runnable {
            connectionTimeout = null
            if (currentAddress.equals(normalizedAddress, ignoreCase = true) &&
                _connectionState.value is BleConnectionState.Connecting
            ) {
                val pairing = pendingOperation is PendingOperation.Pairing
                pendingOperation = PendingOperation.None
                runCatching { gatt?.disconnect() }
                closeGatt()
                _connectionState.value = BleConnectionState.Disconnected
                _state.value = if (pairing) {
                    BleState.Error(text(R.string.error_pairing_connection_timeout))
                } else {
                    BleState.Error(text(R.string.error_connection_timeout))
                }
                restorePresenceAfterLinkFailure(normalizedAddress)
            }
        }.also { mainHandler.postDelayed(it, GATT_CONNECTION_TIMEOUT_MS) }
    }

    fun unlock(profile: DeviceProfile) {
        if (profile.password.isBlank()) {
            _state.value = BleState.Error(text(com.juren233.easyopen.R.string.error_password_not_configured))
            return
        }
        cancelOperationTimeout()
        cancelWriteRetry()
        cancelDescriptorRetry()
        pendingOperation = PendingOperation.Unlock(profile)
        val address = profile.address.trim().uppercase()
        val link = _connectionState.value
        if (link is BleConnectionState.Connected && link.address.equals(address, ignoreCase = true)) {
            sendPendingOperation()
        } else {
            connectAddress(address)
        }
    }

    @SuppressLint("MissingPermission")
    fun disconnect() {
        stopOpenerMonitoring()
        stopBatteryScan()
        pendingOperation = PendingOperation.None
        cancelOperationTimeout()
        cancelConnectionTimeout()
        runCatching { gatt?.disconnect() }
        closeGatt()
        _connectionState.value = BleConnectionState.Disconnected
        _state.value = BleState.Idle
    }

    @SuppressLint("MissingPermission")
    private fun closeGatt() {
        cancelWriteRetry()
        cancelDescriptorRetry()
        runCatching { gatt?.close() }
        gatt = null
        writeCharacteristic = null
        notifyCharacteristic = null
        currentAddress = null
    }

    @SuppressLint("MissingPermission")
    private fun sendPendingOperation(restartTimeout: Boolean = true) {
        val address = currentAddress ?: return
        val characteristic = writeCharacteristic
        val connection = gatt
        if (characteristic == null || connection == null) {
            val pairing = pendingOperation is PendingOperation.Pairing
            pendingOperation = PendingOperation.None
            _state.value = if (pairing) {
                BleState.Error(text(R.string.error_pairing_service_not_ready))
            } else {
                BleState.Error(text(R.string.error_unlock_service_not_ready))
            }
            return
        }
        val packet: ByteArray
        val timeoutMs: Long
        when (val operation = pendingOperation) {
            PendingOperation.None -> return
            is PendingOperation.Pairing -> {
                packet = try {
                    UnlockProtocol.buildPasswordPacket(operation.password)
                } catch (error: IllegalArgumentException) {
                    pendingOperation = PendingOperation.None
                    _state.value = BleState.Error(error.message ?: text(R.string.error_invalid_password_parameter))
                    return
                }
                timeoutMs = 13_000L
                _state.value = BleState.Pairing(address)
            }
            is PendingOperation.Unlock -> {
                packet = try {
                    UnlockProtocol.buildOpenPacket(operation.profile)
                } catch (error: IllegalArgumentException) {
                    pendingOperation = PendingOperation.None
                    _state.value = BleState.Error(error.message ?: text(R.string.error_unlock_parameter_invalid))
                    return
                }
                timeoutMs = 8_000L
                _state.value = BleState.Unlocking(address)
            }
        }

        if (restartTimeout || operationTimeout == null) {
            cancelOperationTimeout()
            operationTimeout = Runnable {
                operationTimeout = null
                cancelWriteRetry()
                cancelDescriptorRetry()
                val operation = pendingOperation
                pendingOperation = PendingOperation.None
                _state.value = when (operation) {
                    is PendingOperation.Pairing -> BleState.Error(text(R.string.error_pairing_timeout))
                    else -> BleState.Error(text(R.string.error_unlock_timeout))
                }
            }.also { mainHandler.postDelayed(it, timeoutMs) }
        }

        try {
            val status = if (Build.VERSION.SDK_INT >= 33) {
                connection.writeCharacteristic(
                    characteristic,
                    packet,
                    BluetoothGattCharacteristic.WRITE_TYPE_NO_RESPONSE,
                )
            } else {
                characteristic.writeType = BluetoothGattCharacteristic.WRITE_TYPE_NO_RESPONSE
                characteristic.value = packet
                if (connection.writeCharacteristic(characteristic)) BluetoothGatt.GATT_SUCCESS else BluetoothGatt.GATT_FAILURE
            }
            if (status == BluetoothStatusCodes.ERROR_GATT_WRITE_REQUEST_BUSY) {
                scheduleWriteRetry(connection, characteristic)
            } else if (status != BluetoothGatt.GATT_SUCCESS) {
                val pairing = pendingOperation is PendingOperation.Pairing
                cancelOperationTimeout()
                cancelWriteRetry()
                pendingOperation = PendingOperation.None
                _state.value = if (pairing) {
                    BleState.Error(text(R.string.error_pairing_write_status, status))
                } else {
                    BleState.Error(text(R.string.error_unlock_write_status, status))
                }
            } else {
                writeRetryCount = 0
            }
        } catch (error: Exception) {
            val pairing = pendingOperation is PendingOperation.Pairing
            cancelOperationTimeout()
            cancelWriteRetry()
            pendingOperation = PendingOperation.None
            _state.value = if (pairing) {
                BleState.Error(text(R.string.error_pairing_write_exception, error.message ?: text(R.string.error_unknown)))
            } else {
                BleState.Error(text(R.string.error_unlock_write_exception, error.message ?: text(R.string.error_unknown)))
            }
        }
    }

    private fun scheduleWriteRetry(
        connection: BluetoothGatt,
        characteristic: BluetoothGattCharacteristic,
    ) {
        if (writeRetryCount >= MAX_WRITE_RETRIES) {
            val pairing = pendingOperation is PendingOperation.Pairing
            cancelOperationTimeout()
            cancelWriteRetry()
            pendingOperation = PendingOperation.None
            _state.value = if (pairing) {
                BleState.Error(text(R.string.error_pairing_write_busy))
            } else {
                BleState.Error(text(R.string.error_unlock_write_busy))
            }
            return
        }
        writeRetryCount += 1
        writeRetry?.let(mainHandler::removeCallbacks)
        writeRetry = Runnable {
            writeRetry = null
            if (pendingOperation !is PendingOperation.None &&
                this@BleDoorController.gatt === connection &&
                writeCharacteristic === characteristic
            ) {
                sendPendingOperation(restartTimeout = false)
            }
        }.also { mainHandler.postDelayed(it, WRITE_RETRY_DELAY_MS) }
    }

    private fun cancelWriteRetry() {
        writeRetry?.let(mainHandler::removeCallbacks)
        writeRetry = null
        writeRetryCount = 0
    }

    private fun scheduleDescriptorRetry(
        gatt: BluetoothGatt,
        descriptor: BluetoothGattDescriptor,
    ) {
        if (descriptorRetryCount >= MAX_WRITE_RETRIES) {
            val pairing = pendingOperation is PendingOperation.Pairing
            cancelDescriptorRetry()
            cancelOperationTimeout()
            pendingOperation = PendingOperation.None
            _state.value = if (pairing) {
                BleState.Error(text(R.string.error_pairing_notification_busy))
            } else {
                BleState.Error(text(R.string.error_unlock_notification_busy))
            }
            return
        }
        descriptorRetryCount += 1
        descriptorRetry?.let(mainHandler::removeCallbacks)
        descriptorRetry = Runnable {
            descriptorRetry = null
            if (pendingOperation !is PendingOperation.None && this@BleDoorController.gatt === gatt) {
                val status = writeNotificationDescriptor(gatt, descriptor)
                handleDescriptorWriteRequestResult(gatt, descriptor, status)
            }
        }.also { mainHandler.postDelayed(it, WRITE_RETRY_DELAY_MS) }
    }

    private fun cancelDescriptorRetry() {
        descriptorRetry?.let(mainHandler::removeCallbacks)
        descriptorRetry = null
        descriptorRetryCount = 0
    }

    private fun writeNotificationDescriptor(
        gatt: BluetoothGatt,
        descriptor: BluetoothGattDescriptor,
    ): Int {
        if (Build.VERSION.SDK_INT >= 31 &&
            ContextCompat.checkSelfPermission(
                appContext,
                Manifest.permission.BLUETOOTH_CONNECT,
            ) != PackageManager.PERMISSION_GRANTED
        ) {
            return BluetoothGatt.GATT_FAILURE
        }
        return try {
            if (Build.VERSION.SDK_INT >= 33) {
                gatt.writeDescriptor(descriptor, BluetoothGattDescriptor.ENABLE_NOTIFICATION_VALUE)
            } else {
                descriptor.value = BluetoothGattDescriptor.ENABLE_NOTIFICATION_VALUE
                if (gatt.writeDescriptor(descriptor)) BluetoothGatt.GATT_SUCCESS else BluetoothGatt.GATT_FAILURE
            }
        } catch (_: SecurityException) {
            BluetoothGatt.GATT_FAILURE
        }
    }

    private fun handleDescriptorWriteRequestResult(
        gatt: BluetoothGatt,
        descriptor: BluetoothGattDescriptor,
        status: Int,
    ) {
        when {
            status == BluetoothGatt.GATT_SUCCESS -> descriptorRetryCount = 0
            status == BluetoothStatusCodes.ERROR_GATT_WRITE_REQUEST_BUSY -> scheduleDescriptorRetry(gatt, descriptor)
            else -> {
                // Keep the original compatibility fallback for non-busy CCCD failures.
                cancelDescriptorRetry()
                markReady()
            }
        }
    }

    private fun cancelConnectionTimeout() {
        connectionTimeout?.let(mainHandler::removeCallbacks)
        connectionTimeout = null
    }

    private fun cancelOperationTimeout() {
        operationTimeout?.let(mainHandler::removeCallbacks)
        operationTimeout = null
    }

    @SuppressLint("MissingPermission")
    private fun failConnection(address: String, message: String) {
        cancelConnectionTimeout()
        cancelOperationTimeout()
        cancelWriteRetry()
        cancelDescriptorRetry()
        pendingOperation = PendingOperation.None
        runCatching { gatt?.disconnect() }
        closeGatt()
        _connectionState.value = BleConnectionState.Disconnected
        _state.value = BleState.Error(message)
        restorePresenceAfterLinkFailure(address)
    }

    private val callback = object : BluetoothGattCallback() {
        @SuppressLint("MissingPermission")
        override fun onConnectionStateChange(gatt: BluetoothGatt, status: Int, newState: Int) {
            if (this@BleDoorController.gatt !== gatt) return
            val address = runCatching { gatt.device.address }.getOrNull()?.uppercase() ?: currentAddress.orEmpty()
            if (newState == BluetoothProfile.STATE_CONNECTED && status == BluetoothGatt.GATT_SUCCESS) {
                cancelConnectionTimeout()
                this@BleDoorController.gatt = gatt
                currentAddress = address
                _connectionState.value = BleConnectionState.Connecting(address)
                if (presenceMonitoringActive && presenceProfile?.address.equals(address, ignoreCase = true)) {
                    publishOpenerConnection(OpenerConnectionStatus.CONNECTING, address)
                }
                _state.value = if (pendingOperation is PendingOperation.Pairing) {
                    BleState.Pairing(address)
                } else {
                    BleState.Connecting(address)
                }
                runCatching { gatt.requestConnectionPriority(BluetoothGatt.CONNECTION_PRIORITY_HIGH) }
                if (!runCatching { gatt.requestMtu(100) }.getOrDefault(false)) {
                    mainHandler.postDelayed({
                        if (this@BleDoorController.gatt === gatt) runCatching { gatt.discoverServices() }
                    }, 300)
                }
            } else if (newState == BluetoothProfile.STATE_DISCONNECTED) {
                cancelConnectionTimeout()
                val operation = pendingOperation
                _connectionState.value = BleConnectionState.Disconnected
                cancelOperationTimeout()
                cancelWriteRetry()
                cancelDescriptorRetry()
                writeCharacteristic = null
                notifyCharacteristic = null
                if (operation !is PendingOperation.None) {
                    val pairing = operation is PendingOperation.Pairing
                    pendingOperation = PendingOperation.None
                    _state.value = if (pairing) {
                        BleState.Error(text(R.string.error_pairing_connection_lost, status))
                    } else {
                        BleState.Error(text(R.string.error_unlock_connection_lost, status))
                    }
                } else if (_state.value !is BleState.Success && _state.value !is BleState.Paired) {
                    _state.value = BleState.Error(text(R.string.error_connection_lost, status))
                }
                closeGatt()
                restorePresenceAfterLinkFailure(address)
            }
        }

        override fun onMtuChanged(gatt: BluetoothGatt, mtu: Int, status: Int) {
            if (this@BleDoorController.gatt !== gatt) return
            if (Build.VERSION.SDK_INT >= 31 &&
                ContextCompat.checkSelfPermission(
                    appContext,
                    Manifest.permission.BLUETOOTH_CONNECT,
                ) != PackageManager.PERMISSION_GRANTED
            ) {
                return
            }
            try {
                gatt.discoverServices()
            } catch (_: SecurityException) {
                // Permission can be revoked between the explicit check and the callback.
            }
        }

        @SuppressLint("MissingPermission")
        override fun onServicesDiscovered(gatt: BluetoothGatt, status: Int) {
            if (this@BleDoorController.gatt !== gatt) return
            val address = currentAddress.orEmpty()
            if (status != BluetoothGatt.GATT_SUCCESS) {
                val pairing = pendingOperation is PendingOperation.Pairing
                failConnection(
                    address,
                    if (pairing) {
                        text(R.string.error_pairing_services_failed, status)
                    } else {
                        text(R.string.error_services_failed, status)
                    },
                )
                return
            }
            val service = gatt.getService(SERVICE_UUID)
            writeCharacteristic = service?.getCharacteristic(WRITE_UUID)
            notifyCharacteristic = service?.getCharacteristic(NOTIFY_UUID)
            if (service == null || writeCharacteristic == null || notifyCharacteristic == null) {
                val pairing = pendingOperation is PendingOperation.Pairing
                failConnection(
                    address,
                    if (pairing) text(R.string.error_pairing_service_missing) else text(R.string.error_service_missing),
                )
                return
            }
            if (!gatt.setCharacteristicNotification(notifyCharacteristic, true)) {
                val pairing = pendingOperation is PendingOperation.Pairing
                failConnection(
                    address,
                    if (pairing) {
                        text(R.string.error_pairing_notifications_failed)
                    } else {
                        text(R.string.error_notifications_failed)
                    },
                )
                return
            }
            val descriptor = notifyCharacteristic?.getDescriptor(CCCD_UUID)
            if (descriptor == null) {
                markReady()
                return
            }
            val descriptorStatus = writeNotificationDescriptor(gatt, descriptor)
            // A busy descriptor write must finish before the password characteristic can be written.
            handleDescriptorWriteRequestResult(gatt, descriptor, descriptorStatus)
        }

        override fun onDescriptorWrite(gatt: BluetoothGatt, descriptor: BluetoothGattDescriptor, status: Int) {
            if (this@BleDoorController.gatt !== gatt) return
            if (status == BluetoothGatt.GATT_SUCCESS) {
                cancelDescriptorRetry()
                markReady()
            } else if (status == BluetoothStatusCodes.ERROR_GATT_WRITE_REQUEST_BUSY) {
                scheduleDescriptorRetry(gatt, descriptor)
            } else {
                // Preserve the original compatibility fallback for non-busy descriptor failures.
                cancelDescriptorRetry()
                markReady()
            }
        }

        override fun onCharacteristicChanged(gatt: BluetoothGatt, characteristic: BluetoothGattCharacteristic) {
            if (this@BleDoorController.gatt !== gatt) return
            if (characteristic.uuid == NOTIFY_UUID) onResponse(characteristic.value)
        }

        override fun onCharacteristicChanged(gatt: BluetoothGatt, characteristic: BluetoothGattCharacteristic, value: ByteArray) {
            if (this@BleDoorController.gatt !== gatt) return
            if (characteristic.uuid == NOTIFY_UUID) onResponse(value)
        }
    }

    private fun markReady() {
        val address = currentAddress ?: return
        cancelConnectionTimeout()
        _connectionState.value = BleConnectionState.Connected(address)
        if (presenceMonitoringActive && presenceProfile?.address.equals(address, ignoreCase = true)) {
            publishOpenerConnection(OpenerConnectionStatus.CONNECTED, address)
        }
        if (pendingOperation is PendingOperation.Pairing) {
            sendPendingOperation()
        } else if (pendingOperation is PendingOperation.Unlock) {
            sendPendingOperation()
        } else {
            _state.value = BleState.Ready(address)
        }
    }

    private fun onResponse(bytes: ByteArray) {
        cancelOperationTimeout()
        cancelWriteRetry()
        cancelDescriptorRetry()
        val address = currentAddress.orEmpty()
        val operation = pendingOperation
        pendingOperation = PendingOperation.None
        when (operation) {
            is PendingOperation.Pairing -> {
                _state.value = if (UnlockProtocol.isSuccess(bytes)) {
                    BleState.Paired(address)
                } else {
                    BleState.Error(
                        if (UnlockProtocol.isFailure(bytes)) {
                            text(R.string.error_pairing_password_wrong)
                        } else {
                            text(R.string.error_pairing_unknown_response, UnlockProtocol.responseSummary(bytes))
                        },
                    )
                }
            }
            is PendingOperation.Unlock -> {
                val summary = UnlockProtocol.responseSummary(bytes)
                _state.value = if (UnlockProtocol.isSuccess(bytes)) {
                    BleState.Success(text(R.string.unlock_success, summary))
                } else {
                    BleState.Error(text(R.string.error_opener_response, summary))
                }
            }
            PendingOperation.None -> {
                _state.value = BleState.Ready(address)
            }
        }
    }
}
