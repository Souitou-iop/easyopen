package com.juren233.easyopen.ble

import android.bluetooth.BluetoothGatt
import android.os.Build
import android.os.SystemClock
import android.util.Log
import com.juren233.easyopen.BuildConfig

/** Purpose of the current GATT session, kept separate from UI operation state. */
enum class BleConnectionPurpose {
    NONE,
    PREHEAT,
    EXPLICIT_CONNECT,
    UNLOCK,
    PAIRING,
}

/** Debug-only timing recorder shared by the GATT session and its controller. */
internal class BleConnectionDiagnostics(
    private val tag: String,
) {
    private var sequence = 0L
    private var sessionId = 0L
    private var startedAtMs = 0L
    private var address = ""
    private var purpose = BleConnectionPurpose.NONE

    fun begin(nextAddress: String, nextPurpose: BleConnectionPurpose) {
        sessionId = ++sequence
        startedAtMs = SystemClock.elapsedRealtime()
        address = nextAddress
        purpose = nextPurpose
        if (BuildConfig.DEBUG) {
            Log.d(
                tag,
                "BLE_TIMING id=$sessionId purpose=${purpose.name.lowercase()} stage=begin " +
                    "elapsedMs=0 address=$address pid=${android.os.Process.myPid()}",
            )
        }
    }

    fun log(stage: String, details: String = "", overrideAddress: String? = null) {
        if (!BuildConfig.DEBUG || sessionId == 0L) return
        val elapsedMs = SystemClock.elapsedRealtime() - startedAtMs
        val suffix = details.takeIf(String::isNotBlank)?.let { " $it" }.orEmpty()
        Log.d(
            tag,
            "BLE_TIMING id=$sessionId purpose=${purpose.name.lowercase()} stage=$stage " +
                "elapsedMs=$elapsedMs address=${overrideAddress ?: address}$suffix",
        )
    }

    fun logCallback(
        stage: String,
        gatt: BluetoothGatt,
        isCurrent: Boolean,
        details: String = "",
    ) {
        val identity = System.identityHashCode(gatt)
        val callbackDetails = "gatt=$identity current=$isCurrent sdk=${Build.VERSION.SDK_INT}" +
            details.takeIf(String::isNotBlank)?.let { " $it" }.orEmpty()
        log(stage, callbackDetails)
    }

    fun currentPurpose(): BleConnectionPurpose = purpose
}
