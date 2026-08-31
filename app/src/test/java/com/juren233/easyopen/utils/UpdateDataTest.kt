package com.juren233.easyopen.utils

import org.junit.Assert.assertFalse
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

class UpdateDataTest {
    @Test
    fun higherVersionCodeIsAnUpdate() {
        assertTrue(
            UpdateData.isUpdateAvailable(
                latestVersionName = "0.2.0",
                latestVersionCode = 40,
                currentVersionName = "0.1.0",
                currentVersionCode = 35,
            ),
        )
    }

    @Test
    fun sameOrOlderVersionCodeIsNotAnUpdate() {
        assertFalse(
            UpdateData.isUpdateAvailable(
                latestVersionName = "0.2.0",
                latestVersionCode = 35,
                currentVersionName = "0.1.0",
                currentVersionCode = 35,
            ),
        )
        assertFalse(
            UpdateData.isUpdateAvailable(
                latestVersionName = "0.1.0",
                latestVersionCode = 34,
                currentVersionName = "0.1.0-beta.1",
                currentVersionCode = 35,
            ),
        )
    }

    @Test
    fun malformedVersionNamesAreIgnored() {
        assertFalse(
            UpdateData.isUpdateAvailable(
                latestVersionName = "latest",
                latestVersionCode = 40,
                currentVersionName = "0.1.0",
                currentVersionCode = 35,
            ),
        )
    }

    @Test
    fun releaseAssetIsPreferredWhenExtractingVersionCode() {
        assertEquals(
            42L,
            UpdateData.extractReleaseVersionCode(
                assetNames = listOf(
                    "EasyOpen-debug-v0.2.0-41.apk",
                    "EasyOpen-release-v0.2.0-42.apk",
                ),
                versionName = "0.2.0",
            ),
        )
    }
}
