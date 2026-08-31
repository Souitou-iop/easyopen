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
    const val APPLICATION_ID = "com.juren233.easyopen"
    const val MIME_TYPE = "application/com.juren233.easyopen.unlock"
    const val PAYLOAD_TEXT = "unlock_current=1"
    private const val AAR_TYPE = "android.com:pkg"

    val payload: ByteArray
        get() = PAYLOAD_TEXT.toByteArray(StandardCharsets.UTF_8)

    fun createRecord(): NdefRecord = NdefRecord.createMime(MIME_TYPE, payload)

    /**
     * Pins Android tag dispatch to EasyOpen's package while the MIME record
     * remains first so that the system still resolves the transparent
     * NfcEntryActivity rather than the launcher activity.
     */
    fun createApplicationRecord(): NdefRecord =
        NdefRecord.createApplicationRecord(APPLICATION_ID)

    fun createMessage(): NdefMessage =
        NdefMessage(arrayOf(createRecord(), createApplicationRecord()))

    /**
     * Keeps every original record and puts one EasyOpen record first. Android
     * determines NDEF dispatch from the first record, so EasyOpen must be first
     * while the remaining records are retained in their original order.
     */
    fun messageForWrite(original: NdefMessage?, preserveOriginal: Boolean): NdefMessage {
        if (!preserveOriginal || original == null) return createMessage()
        val records = listOf(createRecord(), createApplicationRecord()) +
            original.records.filterNot {
                isUnlockRecord(it) || isEasyOpenApplicationRecord(it)
            }
        return NdefMessage(records.toTypedArray())
    }

    fun isUnlockIntent(intent: Intent?): Boolean =
        messageFromIntent(intent)?.records?.any(::isUnlockRecord) == true

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

    fun isEasyOpenApplicationRecord(record: NdefRecord): Boolean =
        isEasyOpenApplicationRecord(record.tnf, record.type, record.payload)

    fun isEasyOpenApplicationRecord(
        tnf: Short,
        type: ByteArray,
        payload: ByteArray,
    ): Boolean =
        tnf == NdefRecord.TNF_EXTERNAL_TYPE &&
            type.toString(StandardCharsets.US_ASCII).equals(AAR_TYPE, ignoreCase = true) &&
            payload.toString(StandardCharsets.UTF_8) == APPLICATION_ID

    fun isUnlockMimeRecord(tnf: Short, type: ByteArray): Boolean {
        if (tnf != NdefRecord.TNF_MIME_MEDIA) return false
        return type.toString(StandardCharsets.US_ASCII)
            .equals(MIME_TYPE, ignoreCase = true)
    }
}
