package com.juren233.easyopen

import android.content.SharedPreferences
import android.widget.Toast
import androidx.compose.runtime.Composable
import androidx.compose.runtime.DisposableEffect
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.rememberUpdatedState
import androidx.compose.runtime.rememberCoroutineScope
import androidx.compose.runtime.setValue
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.res.stringResource
import com.juren233.easyopen.ble.BleDoorController
import com.juren233.easyopen.data.AppSettings
import com.juren233.easyopen.data.DeviceProfile
import com.juren233.easyopen.data.DeviceStore
import com.juren233.easyopen.ui.PermissionGuidePage
import com.juren233.easyopen.nfc.NfcTagEvent
import com.juren233.easyopen.nfc.NfcWriteRequest
import com.juren233.easyopen.nfc.NfcReaderState
import com.juren233.easyopen.nfc.NfcTagWriter
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext

@Composable
internal fun EasyOpenContent(
    controller: BleDoorController,
    preferences: SharedPreferences,
    permissionsGranted: Boolean,
    appSettings: AppSettings,
    onSettingsChange: (AppSettings) -> Unit,
    onRequestPermissions: () -> Unit,
    onOpenBluetoothSettings: () -> Unit,
    nfcEvents: Flow<NfcTagEvent>,
    nfcReaderState: StateFlow<NfcReaderState>,
) {
    val context = LocalContext.current
    val nfcWriteSuccessMessage = stringResource(R.string.nfc_write_success)
    val nfcWriteFailedFormat = stringResource(R.string.nfc_write_failed)
    val nfcWriteFailedUnknownMessage = stringResource(R.string.nfc_write_failed_unknown)
    val scannedDevices by controller.devices.collectAsState()
    val batteryLevels by controller.batteryLevels.collectAsState()
    val nfcState by nfcReaderState.collectAsState()
    val nfcWriteScope = rememberCoroutineScope()
    var nfcWriteWaiting by remember { mutableStateOf(false) }
    var nfcWriteRequest by remember { mutableStateOf<NfcWriteRequest?>(null) }
    var nfcWriting by remember { mutableStateOf(false) }
    var pairedDevices by remember { mutableStateOf(DeviceStore.load(preferences)) }
    var activeAddress by remember {
        mutableStateOf(DeviceStore.activeAddress(preferences, pairedDevices))
    }
    var onboardingComplete by remember {
        mutableStateOf(DeviceStore.onboardingComplete(preferences, pairedDevices))
    }

    LaunchedEffect(permissionsGranted) {
        if (!permissionsGranted) onRequestPermissions()
    }

    LaunchedEffect(Unit) {
        controller.restoreBatteryLevels(pairedDevices)
    }

    LaunchedEffect(batteryLevels) {
        if (batteryLevels.isEmpty() || pairedDevices.isEmpty()) return@LaunchedEffect
        var changed = false
        val nextDevices = pairedDevices.map { profile ->
            val liveLevel = batteryLevels[DeviceStore.normalizeAddress(profile.address)]
            if (liveLevel != null && liveLevel != profile.batteryLevel) {
                changed = true
                profile.copy(batteryLevel = liveLevel)
            } else {
                profile
            }
        }
        if (changed) {
            pairedDevices = nextDevices
            DeviceStore.save(
                preferences = preferences,
                devices = pairedDevices,
                activeAddress = activeAddress,
                onboardingComplete = onboardingComplete,
            )
        }
    }

    fun persistDevices(nextDevices: List<DeviceProfile>, nextActiveAddress: String) {
        val normalizedActive = DeviceStore.normalizeAddress(nextActiveAddress)
        pairedDevices = nextDevices
            .map { it.copy(address = DeviceStore.normalizeAddress(it.address)) }
            .distinctBy { it.address }
        activeAddress = normalizedActive
        onboardingComplete = pairedDevices.isNotEmpty()
        DeviceStore.save(
            preferences = preferences,
            devices = pairedDevices,
            activeAddress = activeAddress,
            onboardingComplete = onboardingComplete,
        )
    }

    fun importDevices(imported: List<DeviceProfile>) {
        if (imported.isEmpty()) return
        val merged = pairedDevices.filterNot { existing ->
            imported.any { it.address.equals(existing.address, ignoreCase = true) }
        } + imported
        persistDevices(merged, imported.first().address)
    }

    val activeProfile = pairedDevices.firstOrNull {
        it.address.equals(activeAddress, ignoreCase = true)
    } ?: pairedDevices.firstOrNull()
    val latestActiveProfile by rememberUpdatedState(activeProfile)
    val latestNfcWriteWaiting by rememberUpdatedState(nfcWriteWaiting)
    val latestOnboardingComplete by rememberUpdatedState(onboardingComplete)
    val latestPermissionsGranted by rememberUpdatedState(permissionsGranted)

    LaunchedEffect(nfcEvents) {
        nfcEvents.collect { event ->
            if (latestNfcWriteWaiting) {
                nfcWriteWaiting = false
                if (!event.ndefReadSucceeded) {
                    Toast.makeText(
                        context,
                        nfcWriteFailedFormat.format("无法读取原 NFC 内容"),
                        Toast.LENGTH_LONG,
                    ).show()
                } else {
                    nfcWriteRequest = NfcWriteRequest(
                        tag = event.tag,
                        originalMessage = event.ndefMessage,
                        originalReadSucceeded = event.ndefReadSucceeded,
                    )
                }
            } else if (
                event.isUnlockCommand &&
                latestPermissionsGranted &&
                latestOnboardingComplete &&
                latestActiveProfile != null
            ) {
                controller.unlock(latestActiveProfile!!)
            }
        }
    }

    fun requestNfcWrite() {
        when {
            !nfcState.supported -> Toast.makeText(
                context,
                R.string.nfc_not_supported,
                Toast.LENGTH_SHORT,
            ).show()
            !nfcState.enabled -> Toast.makeText(
                context,
                R.string.nfc_turn_on,
                Toast.LENGTH_SHORT,
            ).show()
            nfcWriting -> Unit
            else -> {
                nfcWriteRequest = null
                nfcWriteWaiting = true
            }
        }
    }

    fun chooseNfcWriteMode(preserveOriginal: Boolean) {
        val request = nfcWriteRequest ?: return
        nfcWriteRequest = null
        nfcWriting = true
        nfcWriteScope.launch {
            val result = withContext(Dispatchers.IO) {
                NfcTagWriter.write(
                    tag = request.tag,
                    originalMessage = request.originalMessage,
                    originalReadSucceeded = request.originalReadSucceeded,
                    preserveOriginal = preserveOriginal,
                )
            }
            nfcWriting = false
            val message = result.fold(
                onSuccess = { nfcWriteSuccessMessage },
                onFailure = { error ->
                    nfcWriteFailedFormat.format(
                        error.message ?: nfcWriteFailedUnknownMessage,
                    )
                },
            )
            Toast.makeText(context, message, Toast.LENGTH_LONG).show()
        }
    }

    when {
        !permissionsGranted -> PermissionGuidePage(
            onRequestPermissions = onRequestPermissions,
        )
        !onboardingComplete -> OnboardingNavigation(
            controller = controller,
            existingDeviceCount = pairedDevices.size,
            onOpenBluetoothSettings = onOpenBluetoothSettings,
            onPaired = { profile ->
                persistDevices(listOf(profile), profile.address)
            },
            onImported = { imported ->
                persistDevices(imported, imported.firstOrNull()?.address.orEmpty())
            },
            onRestored = { snapshot ->
                persistDevices(snapshot.devices, snapshot.activeAddress)
                onSettingsChange(
                    AppSettings(
                        themeMode = snapshot.themeMode,
                        monetEnabled = snapshot.monetEnabled,
                        autoUnlockOnAppOpen = snapshot.autoUnlockOnAppOpen,
                        autoConnectEnabled = snapshot.autoConnectEnabled,
                        autoConnectRange = snapshot.autoConnectRange,
                        customAutoConnectRssi = snapshot.customAutoConnectRssi,
                    ),
                )
            },
        )
        activeProfile == null -> OnboardingNavigation(
            controller = controller,
            existingDeviceCount = 0,
            onOpenBluetoothSettings = onOpenBluetoothSettings,
            onPaired = { profile ->
                persistDevices(listOf(profile), profile.address)
            },
            onImported = { imported ->
                persistDevices(imported, imported.firstOrNull()?.address.orEmpty())
            },
            onRestored = { snapshot ->
                persistDevices(snapshot.devices, snapshot.activeAddress)
                onSettingsChange(
                    AppSettings(
                        themeMode = snapshot.themeMode,
                        monetEnabled = snapshot.monetEnabled,
                        autoUnlockOnAppOpen = snapshot.autoUnlockOnAppOpen,
                        autoConnectEnabled = snapshot.autoConnectEnabled,
                        autoConnectRange = snapshot.autoConnectRange,
                        customAutoConnectRssi = snapshot.customAutoConnectRssi,
                    ),
                )
            },
        )
        else -> {
            val activeProfileState = androidx.compose.runtime.rememberUpdatedState(activeProfile)
            val appSettingsState = rememberUpdatedState(appSettings)
            EasyOpenNavigation(
                controller = controller,
                devices = pairedDevices,
                appSettings = appSettings,
                appSettingsState = appSettingsState,
                onOpenBluetoothSettings = onOpenBluetoothSettings,
                activeProfileState = activeProfileState,
                activeAddress = activeAddress,
                onActiveDeviceChange = { address ->
                    activeAddress = address
                    DeviceStore.save(
                        preferences = preferences,
                        devices = pairedDevices,
                        activeAddress = address,
                        onboardingComplete = true,
                    )
                },
                onDevicePaired = { profile -> importDevices(listOf(profile)) },
                onProfileChange = { updated ->
                    persistDevices(
                        nextDevices = pairedDevices.map {
                            if (it.address.equals(updated.address, ignoreCase = true)) updated else it
                        },
                        nextActiveAddress = activeAddress,
                    )
                },
                onImported = ::importDevices,
                onSettingsChange = onSettingsChange,
                nfcWriteWaiting = nfcWriteWaiting,
                nfcWriteRequest = nfcWriteRequest,
                nfcWriting = nfcWriting,
                onNfcWriteRequested = ::requestNfcWrite,
                onNfcWriteChoice = ::chooseNfcWriteMode,
                onNfcWriteCancelled = {
                    if (!nfcWriting) {
                        nfcWriteWaiting = false
                        nfcWriteRequest = null
                    }
                },
                onRestore = { snapshot ->
                    persistDevices(snapshot.devices, snapshot.activeAddress)
                    onSettingsChange(
                        AppSettings(
                            themeMode = snapshot.themeMode,
                            monetEnabled = snapshot.monetEnabled,
                            autoUnlockOnAppOpen = snapshot.autoUnlockOnAppOpen,
                            autoConnectEnabled = snapshot.autoConnectEnabled,
                            autoConnectRange = snapshot.autoConnectRange,
                            customAutoConnectRssi = snapshot.customAutoConnectRssi,
                        ),
                    )
                },
            )
        }
    }

    @Suppress("UNUSED_VARIABLE")
    val ignored = scannedDevices
    DisposableEffect(Unit) {
        onDispose {
            controller.stopScan()
            controller.stopOpenerMonitoring()
            controller.stopBatteryScan()
        }
    }
}
