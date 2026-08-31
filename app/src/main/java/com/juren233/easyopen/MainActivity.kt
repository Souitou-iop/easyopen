package com.juren233.easyopen

import android.Manifest
import android.content.Intent
import android.content.pm.PackageManager
import android.os.Build
import android.os.Bundle
import android.provider.Settings
import androidx.activity.ComponentActivity
import androidx.activity.result.contract.ActivityResultContracts
import androidx.activity.compose.setContent
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.getValue
import androidx.compose.runtime.setValue
import androidx.core.content.ContextCompat
import com.juren233.easyopen.utils.UpdateData
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.Job
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.cancel
import kotlinx.coroutines.launch
import com.juren233.easyopen.ble.BleDoorController
import com.juren233.easyopen.nfc.NfcTagReader

class MainActivity : ComponentActivity() {
    private val updateCheckScope = CoroutineScope(SupervisorJob() + Dispatchers.Main.immediate)
    private var updateCheckJob: Job? = null

    private lateinit var controller: BleDoorController
    private lateinit var nfcReader: NfcTagReader
    private var permissionsGranted by mutableStateOf(false)

    private val permissionLauncher = registerForActivityResult(
        ActivityResultContracts.RequestMultiplePermissions(),
    ) {
        permissionsGranted = controller.hasBluetoothPermission()
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        controller = BleDoorController(this)
        nfcReader = NfcTagReader(this)
        permissionsGranted = controller.hasBluetoothPermission()
        setContent {
            EasyOpenApp(
                controller = controller,
                permissionsGranted = permissionsGranted,
                onRequestPermissions = ::requestBluetoothPermissions,
                onOpenBluetoothSettings = {
                    startActivity(Intent(Settings.ACTION_BLUETOOTH_SETTINGS))
                },
                nfcEvents = nfcReader.events,
                nfcReaderState = nfcReader.state,
            )
        }
    }

    override fun onNewIntent(intent: Intent) {
        super.onNewIntent(intent)
        setIntent(intent)
        nfcReader.handleIntent(intent)
    }

    private fun requestBluetoothPermissions() {
        val permissions = if (Build.VERSION.SDK_INT >= 31) {
            arrayOf(
                Manifest.permission.BLUETOOTH_SCAN,
                Manifest.permission.BLUETOOTH_CONNECT,
                Manifest.permission.ACCESS_FINE_LOCATION,
                Manifest.permission.ACCESS_COARSE_LOCATION,
            )
        } else {
            arrayOf(Manifest.permission.ACCESS_FINE_LOCATION)
        }
        val missing = permissions.filter {
            ContextCompat.checkSelfPermission(this, it) != PackageManager.PERMISSION_GRANTED
        }
        if (missing.isNotEmpty()) permissionLauncher.launch(missing.toTypedArray())
    }

    override fun onStart() {
        super.onStart()
        updateCheckJob?.cancel()
        updateCheckJob = updateCheckScope.launch {
            UpdateData.refresh(
                currentVersionName = BuildConfig.VERSION_NAME,
                currentVersionCode = BuildConfig.VERSION_CODE.toLong(),
            )
        }
    }

    override fun onResume() {
        super.onResume()
        nfcReader.onResume()
    }

    override fun onPause() {
        nfcReader.onPause()
        super.onPause()
    }

    override fun onDestroy() {
        updateCheckScope.cancel()
        nfcReader.close()
        controller.disconnect()
        super.onDestroy()
    }
}

