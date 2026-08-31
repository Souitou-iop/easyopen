package com.juren233.easyopen.nfc

import android.content.Intent
import android.nfc.NdefMessage
import android.nfc.NdefRecord
import android.nfc.NfcAdapter
import android.nfc.Tag
import android.nfc.tech.Ndef
import android.os.Build
import java.nio.charset.StandardCharsets

/** The application-owned NDEF command understood by EasyOpen. */
object NfcCommand {
    // This must belong to EasyOpen, not to the original YILA package.
    const val MIME_TYPE = "application/com.juren233.easyopen.unlock"
    const val PAYLOAD_TEXT = "unlock_current=1"

    val payload: ByteArray
        get() = PAYLOAD_TEXT.toByteArray(StandardCharsets.UTF_8)

    fun createRecord(): NdefRecord = NdefRecord.createMime(MIME_TYPE, payload)

    fun createMessage(): NdefMessage = NdefMessage(arrayOf(createRecord()))

    /**
     * Keeps every original record and puts one EasyOpen record first. Android
     * determines NDEF dispatch from the first record, so EasyOpen must be first
     * while the remaining records are retained in their original order.
     */
    fun messageForWrite(original: NdefMessage?, preserveOriginal: Boolean): NdefMessage {
        if (!preserveOriginal || original == null) return createMessage()
        val records = listOf(createRecord()) + original.records.filterNot(::isUnlockRecord)
        return NdefMessage(records.toTypedArray())
    }

    fun isUnlockIntent(intent: Intent?): Boolean {
        if (intent?.action != NfcAdapter.ACTION_NDEF_DISCOVERED) return false
        return messageFromIntent(intent)?.records?.any(::isUnlockRecord) == true
    }

    /** Returns the first NDEF message supplied by Android's NFC dispatch. */
    fun messageFromIntent(intent: Intent?): NdefMessage? {
        if (intent == null) return null
        val parcelables = if (Build.VERSION.SDK_INT >= 33) {
            intent.getParcelableArrayExtra(
                NfcAdapter.EXTRA_NDEF_MESSAGES,
                NdefMessage::class.java,
            )
        } else {
            @Suppress("DEPRECATION")
            intent.getParcelableArrayExtra(NfcAdapter.EXTRA_NDEF_MESSAGES)
        }
        return parcelables.orEmpty().mapNotNull { it as? NdefMessage }.firstOrNull()
    }

    /** Reads the current NDEF content without changing it. */
    fun readMessage(tag: Tag): Result<NdefMessage?> = runCatching {
        val ndef = Ndef.get(tag) ?: return@runCatching null
        try {
            ndef.connect()
            ndef.ndefMessage
        } finally {
            runCatching { ndef.close() }
        }
    }

    fun isUnlockRecord(record: NdefRecord): Boolean =
        isUnlockMimeRecord(record.tnf, record.type)

    fun isUnlockMimeRecord(tnf: Short, type: ByteArray): Boolean {
        if (tnf != NdefRecord.TNF_MIME_MEDIA) return false
        return type.toString(StandardCharsets.US_ASCII)
            .equals(MIME_TYPE, ignoreCase = true)
    }
}
