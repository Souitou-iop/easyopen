package com.juren233.easyopen.ui

import androidx.compose.foundation.text.KeyboardOptions
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.text.input.KeyboardType
import com.juren233.easyopen.R
import top.yukonga.miuix.kmp.basic.TextField

@Composable
internal fun formatBatteryLevel(level: Int?): String = stringResource(
    when (level) {
        1 -> R.string.battery_low
        2 -> R.string.battery_25
        3 -> R.string.battery_50
        4 -> R.string.battery_75
        5 -> R.string.battery_100
        else -> R.string.battery_unknown
    },
)
@Composable
internal fun NumberField(
    label: String,
    value: String,
    onValueChange: (String) -> Unit,
    modifier: Modifier,
) {
    TextField(
        value = value,
        onValueChange = { onValueChange(it.filter(Char::isDigit)) },
        label = label,
        modifier = modifier,
        maxLines = 1,
        keyboardOptions = KeyboardOptions(keyboardType = KeyboardType.Number),
    )
}
