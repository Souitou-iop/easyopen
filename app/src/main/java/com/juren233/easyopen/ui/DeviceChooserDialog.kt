package com.juren233.easyopen.ui

import androidx.compose.foundation.layout.Column
import androidx.compose.runtime.Composable
import androidx.compose.ui.res.stringResource
import com.juren233.easyopen.R
import com.juren233.easyopen.data.DeviceProfile
import top.yukonga.miuix.kmp.preference.ArrowPreference
import top.yukonga.miuix.kmp.window.WindowDialog

@Composable
internal fun DeviceChooserDialog(
    devices: List<DeviceProfile>,
    activeAddress: String,
    onDismiss: () -> Unit,
    onSelect: (String) -> Unit,
    onAddDevice: () -> Unit,
) {
    WindowDialog(
        title = stringResource(R.string.switch_opener_dialog_title),
        show = true,
        onDismissRequest = onDismiss,
    ) {
        Column {
            devices.forEach { device ->
                ArrowPreference(
                    title = device.name,
                    summary = if (device.address.equals(activeAddress, ignoreCase = true)) {
                        stringResource(R.string.current_device_summary, device.address)
                    } else {
                        device.address
                    },
                    onClick = { onSelect(device.address) },
                )
            }
            ArrowPreference(
                title = stringResource(R.string.add_opener_title),
                summary = stringResource(R.string.add_opener_dialog_summary),
                onClick = onAddDevice,
            )
        }
    }
}
