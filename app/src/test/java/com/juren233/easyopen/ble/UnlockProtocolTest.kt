package com.juren233.easyopen.ble

import com.juren233.easyopen.data.DeviceProfile
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

class UnlockProtocolTest {
    @Test
    fun passwordToken_matchesOriginalRules() {
        assertEquals("0123456789abcdef", UnlockProtocol.passwordToken("0123456789abcdef"))
        assertEquals("89abcdef01234567", UnlockProtocol.passwordToken("0123456789abcdef0123456789abcdef"))
        assertEquals(UnlockProtocol.md5("123456").substring(8, 24), UnlockProtocol.passwordToken("123456"))
    }

    @Test
    fun packet_isEncryptedAndBlockAligned() {
        val packet = UnlockProtocol.buildOpenPacket(
            DeviceProfile(address = "AA:BB:CC:DD:EE:FF", password = "123456"),
            epochSeconds = 1_700_000_000,
        )
        assertTrue(packet.isNotEmpty())
        assertEquals(0, packet.size % 16)
        assertTrue(packet.any { it.toInt() !in 0x20..0x7e })
    }

    @Test
    fun responseParser_acceptsAsciiAndHexOk() {
        assertTrue(UnlockProtocol.isSuccess("OK".toByteArray()))
        assertTrue(UnlockProtocol.isSuccess(byteArrayOf(0x4f, 0x4b)))
        assertEquals("OK", UnlockProtocol.responseSummary("OK".toByteArray()))
    }

    @Test
    fun responseParser_classifiesPairingFailureAndUnknownResponse() {
        assertTrue(UnlockProtocol.isFailure("ERROR".toByteArray()))
        assertTrue(UnlockProtocol.isFailure("FAIL".toByteArray()))
        assertEquals("ERROR", UnlockProtocol.responseSummary("ERROR".toByteArray()))
        assertEquals("HEX 0102", UnlockProtocol.responseSummary(byteArrayOf(0x01, 0x02)))
    }

    @Test
    fun batteryParser_readsOriginalManufacturerLevel() {
        // AD structures: flags, then manufacturer data whose final byte is level 5.
        val scanRecord = byteArrayOf(2, 0x01, 0x06, 4, 0xff.toByte(), 0x00, 0x00, 0x05)
        assertEquals(5, BatteryAdvertisementParser.parse(scanRecord))
        assertEquals(5, UnlockProtocol.parseBatteryLevel(scanRecord))
    }

    @Test
    fun batteryParser_skipsInvalidManufacturerLevelAndUsesRecordFallback() {
        val scanRecord = byteArrayOf(2, 0x01, 0x06, 4, 0xff.toByte(), 0x00, 0x00, 0x09, 1, 0x05)
        assertEquals(5, BatteryAdvertisementParser.parse(scanRecord))
    }

    @Test
    fun batteryParser_rejectsMalformedAdStructure() {
        assertEquals(null, BatteryAdvertisementParser.parse(byteArrayOf(5, 0xff.toByte(), 0x00)))
        assertEquals(null, BatteryAdvertisementParser.parse(null))
    }
}

