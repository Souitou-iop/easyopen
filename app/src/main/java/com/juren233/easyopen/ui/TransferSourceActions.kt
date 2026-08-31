package com.juren233.easyopen.ui

import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import com.juren233.easyopen.R
import top.yukonga.miuix.kmp.basic.ButtonDefaults
import top.yukonga.miuix.kmp.basic.TextButton as MiuixTextButton
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.unit.dp

/** Consistent transfer-source actions for the initial and recognized states. */
@Composable
internal fun TransferSourceActions(
    recognized: Boolean,
    allowBackupRestore: Boolean,
    decoding: Boolean,
    onRescan: () -> Unit,
    onGallery: () -> Unit,
    onRestoreFile: () -> Unit,
) {
    Column(
        modifier = Modifier.fillMaxWidth(),
        verticalArrangement = Arrangement.spacedBy(8.dp),
    ) {
        if (recognized) {
            MiuixTextButton(
                text = stringResource(R.string.rescan_qr),
                onClick = onRescan,
                enabled = !decoding,
                modifier = Modifier.fillMaxWidth(),
                colors = ButtonDefaults.textButtonColorsPrimary(),
            )
        }
        MiuixTextButton(
            text = stringResource(
                if (recognized) R.string.rescan_from_gallery else R.string.scan_from_gallery,
            ),
            onClick = onGallery,
            enabled = !decoding,
            modifier = Modifier.fillMaxWidth(),
            colors = ButtonDefaults.textButtonColorsPrimary(),
        )
        if (allowBackupRestore) {
            MiuixTextButton(
                text = stringResource(
                    if (recognized) R.string.rescan_backup_file else R.string.restore_backup_file,
                ),
                onClick = onRestoreFile,
                enabled = !decoding,
                modifier = Modifier.fillMaxWidth(),
                colors = ButtonDefaults.textButtonColorsPrimary(),
            )
        }
    }
}

