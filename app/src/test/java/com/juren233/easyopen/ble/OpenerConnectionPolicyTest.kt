package com.juren233.easyopen.ble

import com.juren233.easyopen.data.AutoConnectSettings
import org.junit.Assert.assertFalse
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

class OpenerConnectionPolicyTest {
    @Test
    fun autoConnectUsesModerateDefaultThreshold() {
        assertTrue(OpenerConnectionPolicy.shouldAutoConnect(-90))
        assertTrue(OpenerConnectionPolicy.shouldAutoConnect(-40))
        assertFalse(OpenerConnectionPolicy.shouldAutoConnect(-91))
    }

    @Test
    fun autoConnectSupportsConfiguredRanges() {
        assertEquals(-80, AutoConnectSettings.thresholdFor(AutoConnectSettings.RANGE_NEAR, -90))
        assertEquals(-90, AutoConnectSettings.thresholdFor(AutoConnectSettings.RANGE_MODERATE, -80))
        assertEquals(-100, AutoConnectSettings.thresholdFor(AutoConnectSettings.RANGE_FAR, -90))
        assertEquals(-92, AutoConnectSettings.thresholdFor(AutoConnectSettings.RANGE_CUSTOM, 92))
        assertTrue(OpenerConnectionPolicy.shouldAutoConnect(-92, -92))
        assertFalse(OpenerConnectionPolicy.shouldAutoConnect(-93, -92))
    }

    @Test
    fun signalFreshnessDoesNotOverrideRssiThreshold() {
        assertTrue(OpenerConnectionPolicy.isSignalFresh(10_000L, 10_100L))
        assertFalse(OpenerConnectionPolicy.shouldAutoConnect(-91, -90))
        assertTrue(OpenerConnectionPolicy.shouldAutoConnect(-90, -90))
    }

    @Test
    fun customRssiInputAlwaysBecomesNegativeAndStaysInBleRange() {
        assertEquals(-92, AutoConnectSettings.normalizeRssiThreshold(92))
        assertEquals(-127, AutoConnectSettings.normalizeRssiThreshold(-200))
        assertEquals(-1, AutoConnectSettings.normalizeRssiThreshold(0))
    }

    @Test
    fun recentSignalSurvivesScanRestartGapOnly() {
        assertTrue(OpenerConnectionPolicy.isSignalFresh(10_000L, 24_999L))
        assertFalse(OpenerConnectionPolicy.isSignalFresh(10_000L, 25_001L))
        assertFalse(OpenerConnectionPolicy.isSignalFresh(0L, 1L))
    }
}
