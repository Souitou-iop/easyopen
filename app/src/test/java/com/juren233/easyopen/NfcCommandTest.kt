package com.juren233.easyopen

import com.juren233.easyopen.nfc.NfcCommand
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import java.nio.charset.StandardCharsets
import org.junit.Test

class NfcCommandTest {
    @Test
    fun usesEasyOpenApplicationSpecificMimeType() {
        assertEquals(
            "application/com.juren233.easyopen.unlock",
            NfcCommand.MIME_TYPE,
        )
    }

    @Test
    fun canonicalPayloadIsStable() {
        assertEquals("unlock_current=1", NfcCommand.PAYLOAD_TEXT)
        assertEquals(NfcCommand.PAYLOAD_TEXT, NfcCommand.payload.decodeToString())
    }

    @Test
    fun recognizesEasyOpenApplicationRecordByExactPackage() {
        assertTrue(
            NfcCommand.isEasyOpenApplicationRecord(
                android.nfc.NdefRecord.TNF_EXTERNAL_TYPE,
                "android.com:pkg".toByteArray(StandardCharsets.US_ASCII),
                NfcCommand.APPLICATION_ID.toByteArray(StandardCharsets.UTF_8),
            ),
        )
        assertFalse(
            NfcCommand.isEasyOpenApplicationRecord(
                android.nfc.NdefRecord.TNF_EXTERNAL_TYPE,
                "android.com:pkg".toByteArray(StandardCharsets.US_ASCII),
                "com.example.other".toByteArray(StandardCharsets.UTF_8),
            ),
        )
    }

    @Test
    fun recognizesOnlyTheApplicationSpecificMimeRecord() {
        assertTrue(
            NfcCommand.isUnlockMimeRecord(
                android.nfc.NdefRecord.TNF_MIME_MEDIA,
                "APPLICATION/COM.JUREN233.EASYOPEN.UNLOCK".toByteArray(StandardCharsets.US_ASCII),
            ),
        )
        assertFalse(
            NfcCommand.isUnlockMimeRecord(
                android.nfc.NdefRecord.TNF_MIME_MEDIA,
                "text/plain".toByteArray(StandardCharsets.US_ASCII),
            ),
        )
        assertFalse(
            NfcCommand.isUnlockMimeRecord(
                android.nfc.NdefRecord.TNF_WELL_KNOWN,
                NfcCommand.MIME_TYPE.toByteArray(StandardCharsets.US_ASCII),
            ),
        )
    }
}
