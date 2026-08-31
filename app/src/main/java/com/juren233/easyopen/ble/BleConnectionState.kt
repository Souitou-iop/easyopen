package com.juren233.easyopen.ble

/** Physical GATT link state, kept separate from scan and command-operation state. */
sealed interface BleConnectionState {
    data object Disconnected : BleConnectionState
    data class Connecting(val address: String) : BleConnectionState
    data class Connected(val address: String) : BleConnectionState
}
