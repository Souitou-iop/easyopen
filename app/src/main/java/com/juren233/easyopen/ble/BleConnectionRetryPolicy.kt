package com.juren233.easyopen.ble

/** Connection phases used to prevent a new GATT session from racing an old release. */
enum class BleConnectionPhase {
    DISCONNECTED,
    CONNECTING,
    READY,
    RELEASING,
}

/**
 * Event-driven retry gate. A retry is allowed only after release completed and a
 * fresh advertisement has been observed; it never owns a retry timer.
 */
internal class BleConnectionRetryPolicy {
    var phase: BleConnectionPhase = BleConnectionPhase.DISCONNECTED
        private set

    var waitingForFreshAdvertisement: Boolean = false
        private set

    fun beginConnect(requireFreshAdvertisement: Boolean): Boolean {
        if (phase != BleConnectionPhase.DISCONNECTED) return false
        if (requireFreshAdvertisement && waitingForFreshAdvertisement) return false
        waitingForFreshAdvertisement = false
        phase = BleConnectionPhase.CONNECTING
        return true
    }

    fun markReady() {
        phase = BleConnectionPhase.READY
    }

    fun beginRelease(): Boolean {
        if (phase == BleConnectionPhase.RELEASING) return false
        phase = BleConnectionPhase.RELEASING
        return true
    }

    fun markReleased(waitForFreshAdvertisement: Boolean) {
        phase = BleConnectionPhase.DISCONNECTED
        waitingForFreshAdvertisement = waitForFreshAdvertisement
    }

    fun consumeFreshAdvertisement(): Boolean {
        if (!waitingForFreshAdvertisement) return true
        waitingForFreshAdvertisement = false
        return true
    }

    fun reset() {
        phase = BleConnectionPhase.DISCONNECTED
        waitingForFreshAdvertisement = false
    }
}
