package com.juren233.easyopen.transfer

import android.content.ContentResolver
import android.net.Uri
import com.juren233.easyopen.data.TransferCodec

/** Reads transfer files selected by the user without coupling file I/O to a UI page. */
object TransferFileDecoder {
    fun decodeBackup(contentResolver: ContentResolver, uri: Uri): TransferCodec.BackupSnapshot? {
        return runCatching {
            contentResolver.openInputStream(uri)?.bufferedReader(Charsets.UTF_8)?.use { reader ->
                TransferCodec.decodeBackup(reader.readText())
            }
        }.getOrNull()
    }
}
