package com.juren233.easyopen.ble

import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

class BleConnectionRetryPolicyTest {
    @Test
    fun preheatRetryWaitsForReleaseAndFreshAdvertisement() {
        val policy = BleConnectionRetryPolicy()

        assertTrue(policy.beginConnect(requireFreshAdvertisement = true))
        policy.markReady()
        assertTrue(policy.beginRelease())
        policy.markReleased(waitForFreshAdvertisement = true)

        assertFalse(policy.beginConnect(requireFreshAdvertisement = true))
        assertTrue(policy.consumeFreshAdvertisement())
        assertTrue(policy.beginConnect(requireFreshAdvertisement = true))
    }

    @Test
    fun explicitOperationMayConnectWithoutFreshAdvertisement() {
        val policy = BleConnectionRetryPolicy()
        policy.markReleased(waitForFreshAdvertisement = true)

        assertTrue(policy.beginConnect(requireFreshAdvertisement = false))
    }

    @Test
    fun releaseCannotBeStartedTwice() {
        val policy = BleConnectionRetryPolicy()

        assertTrue(policy.beginConnect(requireFreshAdvertisement = false))
        assertTrue(policy.beginRelease())
        assertFalse(policy.beginRelease())
    }
}
