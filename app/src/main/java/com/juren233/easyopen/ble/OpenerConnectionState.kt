package com.juren233.easyopen.ble

/** The four user-facing states of the active opener on the home page. */
enum class OpenerConnectionStatus {
    NOT_FOUND,
    DISCOVERED,
    CONNECTING,
    CONNECTED,
}

data class OpenerConnectionSnapshot(
    val status: OpenerConnectionStatus = OpenerConnectionStatus.NOT_FOUND,
    val address: String = "",
    val rssi: Int? = null,
)
