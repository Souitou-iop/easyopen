package com.juren233.easyopen.ble

import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

class BleDiscoveryFilterTest {
    @Test
    fun originalLocalScanNameRule_keepsYiLaAndRejectsRemote() {
        assertTrue(BleDoorController.isYiLaOpenerName("YILA"))
        assertTrue(BleDoorController.isYiLaOpenerName("YiLa-AB12"))
        assertFalse(BleDoorController.isYiLaOpenerName("YILA_REMOTE"))
        assertFalse(BleDoorController.isYiLaOpenerName("REMOTE_YILA"))
        assertFalse(BleDoorController.isYiLaOpenerName("Other BLE device"))
    }

    @Test
    fun passwordInitializationPacket_matchesSixDigitPairingContract() {
        val packet = UnlockProtocol.buildPasswordPacket("123456", epochSeconds = 1_700_000_000)
        assertTrue(packet.isNotEmpty())
        assertTrue(packet.size % 16 == 0)
    }
    @Test
    fun batteryScanMatcher_acceptsTargetAddressWithoutAdvertisedName() {
        val match = BatteryScanMatcher.match(
            address = "AA:BB:CC:DD:EE:FF",
            targetAddress = "aa:bb:cc:dd:ee:ff",
            advertisedName = "",
            hasNordicUartService = false,
        )
        assertTrue(match.addressMatches)
        assertTrue(match.isTarget)
    }

    @Test
    fun batteryScanMatcher_reportsNordicUartServiceSeparately() {
        val match = BatteryScanMatcher.match(
            address = "AA:BB:CC:DD:EE:FF",
            targetAddress = "11:22:33:44:55:66",
            advertisedName = "Other",
            hasNordicUartService = true,
        )
        assertTrue(match.serviceMatches)
        assertTrue(match.isTarget)
    }

    @Test
    fun advertisementNameParser_prefersCompleteNameAndSupportsShortName() {
        val shortName = byteArrayOf(3, 0x08, 'Y'.code.toByte(), 'I'.code.toByte())
        assertTrue(AdvertisementNameParser.parse(shortName) == "YI")

        val completeName = byteArrayOf(3, 0x09, 'Y'.code.toByte(), 'L'.code.toByte())
        assertTrue(AdvertisementNameParser.parse(completeName) == "YL")
    }

}
