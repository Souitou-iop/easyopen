package com.juren233.easyopen.ble

/** Reads the local/complete name from raw BLE AD structures like the original app. */
object AdvertisementNameParser {
    private const val AD_TYPE_SHORT_LOCAL_NAME = 0x08
    private const val AD_TYPE_COMPLETE_LOCAL_NAME = 0x09

    fun parse(scanRecord: ByteArray?): String? {
        if (scanRecord == null || scanRecord.isEmpty()) return null
        var offset = 0
        var shortName: String? = null
        while (offset < scanRecord.size) {
            val length = scanRecord[offset].toInt() and 0xFF
            if (length == 0) break
            val endExclusive = offset + 1 + length
            if (endExclusive <= offset || endExclusive > scanRecord.size) break
            val type = scanRecord.getOrNull(offset + 1)?.toInt()?.and(0xFF)
            if (type == AD_TYPE_COMPLETE_LOCAL_NAME || type == AD_TYPE_SHORT_LOCAL_NAME) {
                val value = scanRecord.copyOfRange(offset + 2, endExclusive)
                    .toString(Charsets.UTF_8)
                    .trim('\u0000', ' ', '\t', '\r', '\n')
                if (value.isNotBlank()) {
                    if (type == AD_TYPE_COMPLETE_LOCAL_NAME) return value
                    shortName = value
                }
            }
            offset = endExclusive
        }
        return shortName
    }
}
