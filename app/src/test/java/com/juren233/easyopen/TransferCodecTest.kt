package com.juren233.easyopen

import com.juren233.easyopen.data.DeviceProfile
import com.juren233.easyopen.data.TransferCodec
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertTrue
import org.junit.Test

class TransferCodecTest {
    private val profile = DeviceProfile(
        name = "车库门",
        address = "E0:E6:6F:3C:A5:B2",
        password = "123456",
        attribute = 1,
        openTimeMs = 700,
        waitTimeMs = 2200,
        closeTimeMs = 650,
        batteryLevel = 4,
    )

    @Test
    fun sharePayload_isEncryptedAndRoundTrips() {
        val payload = TransferCodec.encodeShare(listOf(profile))
        assertTrue(payload.startsWith("EASYOPEN-SHARE:2:"))
        assertTrue(payload.length < 180)
        assertTrue(!payload.contains(profile.password))
        assertEquals(listOf(profile), TransferCodec.decodeShare(payload))
    }

    @Test
    fun backupRoundTripsThemeAndMultipleProfiles() {
        val backup = TransferCodec.encodeBackup(
            devices = listOf(profile, profile.copy(address = "AA:BB:CC:DD:EE:FF", name = "侧门")),
            activeAddress = profile.address,
            themeMode = 2,
            monetEnabled = true,
            autoUnlockOnAppOpen = true,
            autoConnectEnabled = false,
            autoConnectRange = 3,
            customAutoConnectRssi = -92,
        )
        val restored = TransferCodec.decodeBackup(backup)
        assertNotNull(restored)
        assertEquals(2, restored?.devices?.size)
        assertEquals(profile.address, restored?.activeAddress)
        assertEquals(2, restored?.themeMode)
        assertTrue(restored?.monetEnabled == true)
        assertTrue(restored?.autoUnlockOnAppOpen == true)
        assertTrue(restored?.autoConnectEnabled == false)
        assertEquals(3, restored?.autoConnectRange)
        assertEquals(-92, restored?.customAutoConnectRssi)
    }
}
