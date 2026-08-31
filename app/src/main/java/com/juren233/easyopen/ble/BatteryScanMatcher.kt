package com.juren233.easyopen.ble

/** Match metadata for one raw BLE scan callback. */
data class BatteryScanMatch(
    val addressMatches: Boolean,
    val nameMatches: Boolean,
    val serviceMatches: Boolean,
) {
    /** The same target rule used by the active battery scan. */
    val isTarget: Boolean
        get() = addressMatches || nameMatches || serviceMatches
}

/** Keeps target matching separate from scan-window and battery parsing code. */
object BatteryScanMatcher {
    fun match(
        address: String,
        targetAddress: String?,
        advertisedName: String,
        hasNordicUartService: Boolean,
    ): BatteryScanMatch = BatteryScanMatch(
        addressMatches = targetAddress != null && address.equals(targetAddress, ignoreCase = true),
        nameMatches = BleDoorController.isYiLaOpenerName(advertisedName),
        serviceMatches = hasNordicUartService,
    )
}
