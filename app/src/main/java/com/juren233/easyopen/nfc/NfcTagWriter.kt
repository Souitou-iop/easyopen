package com.juren233.easyopen.nfc

import android.nfc.NdefMessage
import android.nfc.Tag
import android.nfc.tech.Ndef
import android.nfc.tech.NdefFormatable

/** Writes EasyOpen's NDEF record, optionally preserving the existing records. */
object NfcTagWriter {
    fun write(
        tag: Tag,
        originalMessage: NdefMessage?,
        originalReadSucceeded: Boolean,
        preserveOriginal: Boolean,
    ): Result<Unit> = runCatching {
        check(!preserveOriginal || originalReadSucceeded) { "无法读取原 NFC 内容，未执行写入" }
        val message = NfcCommand.messageForWrite(originalMessage, preserveOriginal)
        val messageSize = message.toByteArray().size
        val ndef = Ndef.get(tag)
        if (ndef != null) {
            try {
                ndef.connect()
                check(ndef.isWritable) { "NFC 标签不可写" }
                check(ndef.maxSize >= messageSize) {
                    if (preserveOriginal) "NFC 标签容量不足，无法保留原内容" else "NFC 标签容量不足"
                }
                ndef.writeNdefMessage(message)
            } finally {
                closeQuietly { ndef.close() }
            }
            return@runCatching
        }

        check(originalMessage == null) { "无法读取原 NFC 内容，未执行覆盖写入" }
        val formatable = NdefFormatable.get(tag)
            ?: error("此 NFC 标签不支持 NDEF 写入")
        try {
            formatable.connect()
            formatable.format(message)
        } finally {
            closeQuietly { formatable.close() }
        }
    }

    private fun closeQuietly(close: () -> Unit) {
        runCatching(close)
    }
}
