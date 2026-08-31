package com.juren233.easyopen.ble

import com.juren233.easyopen.data.AutoConnectSettings

/** Small, platform-independent rules for deciding when a discovered opener may be connected. */
object OpenerConnectionPolicy {
    /** Default threshold: the moderate automatic-connection range, -90 dBm. */
    const val AUTO_CONNECT_RSSI_THRESHOLD = AutoConnectSettings.DEFAULT_RSSI_THRESHOLD

    /** Keep a recent discovery visible across a short scan restart gap. */
    const val SIGNAL_STALE_AFTER_MS = 15_000L

    /** Short guard against duplicate callbacks without delaying the next real attempt. */
    const val AUTO_CONNECT_RETRY_COOLDOWN_MS = 450L

    fun shouldAutoConnect(
        rssi: Int,
        threshold: Int = AUTO_CONNECT_RSSI_THRESHOLD,
    ): Boolean = rssi >= threshold

    fun isSignalFresh(lastSeenAtMs: Long, nowMs: Long): Boolean =
        lastSeenAtMs > 0L && nowMs - lastSeenAtMs <= SIGNAL_STALE_AFTER_MS
}
