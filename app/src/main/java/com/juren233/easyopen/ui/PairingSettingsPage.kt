package com.juren233.easyopen.ui

import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.PaddingValues
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.juren233.easyopen.R
import top.yukonga.miuix.kmp.basic.ButtonDefaults
import top.yukonga.miuix.kmp.basic.Card
import top.yukonga.miuix.kmp.basic.Text as MiuixText
import top.yukonga.miuix.kmp.basic.TextButton as MiuixTextButton
import top.yukonga.miuix.kmp.basic.TextField
import top.yukonga.miuix.kmp.theme.MiuixTheme

@Composable
internal fun PairingSettingsPage(
    innerPadding: PaddingValues,
    name: String,
    onNameChange: (String) -> Unit,
    attribute: Int,
    onAttributeChange: (Int) -> Unit,
    openTime: String,
    onOpenTimeChange: (String) -> Unit,
    waitTime: String,
    onWaitTimeChange: (String) -> Unit,
    closeTime: String,
    onCloseTimeChange: (String) -> Unit,
    onComplete: () -> Unit,
) {
    LazyColumn(
        modifier = Modifier.fillMaxSize(),
        contentPadding = PaddingValues(
            top = innerPadding.calculateTopPadding(),
            bottom = innerPadding.calculateBottomPadding() + 24.dp,
        ),
    ) {
        item {
            Card(
                modifier = Modifier
                    .padding(horizontal = 12.dp)
                    .padding(bottom = 12.dp)
                    .fillMaxWidth(),
            ) {
                Column(
                    modifier = Modifier.padding(horizontal = 16.dp, vertical = 12.dp),
                    verticalArrangement = Arrangement.spacedBy(12.dp),
                ) {
                    TextField(
                        value = name,
                        onValueChange = onNameChange,
                        label = stringResource(R.string.opener_name_optional),
                        modifier = Modifier.fillMaxWidth(),
                        maxLines = 1,
                    )
                    MiuixText(
                        text = stringResource(R.string.lock_direction),
                        fontSize = 14.sp,
                        color = MiuixTheme.colorScheme.onSurfaceVariantSummary,
                    )
                    Row(
                        horizontalArrangement = Arrangement.spacedBy(8.dp),
                        modifier = Modifier.fillMaxWidth(),
                    ) {
                        MiuixTextButton(
                            text = stringResource(R.string.forward),
                            onClick = { onAttributeChange(0) },
                            modifier = Modifier.weight(1f),
                            colors = if (attribute == 0) {
                                ButtonDefaults.textButtonColorsPrimary()
                            } else {
                                ButtonDefaults.textButtonColors()
                            },
                        )
                        MiuixTextButton(
                            text = stringResource(R.string.reverse),
                            onClick = { onAttributeChange(1) },
                            modifier = Modifier.weight(1f),
                            colors = if (attribute == 1) {
                                ButtonDefaults.textButtonColorsPrimary()
                            } else {
                                ButtonDefaults.textButtonColors()
                            },
                        )
                    }
                    Row(
                        horizontalArrangement = Arrangement.spacedBy(8.dp),
                        modifier = Modifier.fillMaxWidth(),
                    ) {
                        NumberField(stringResource(R.string.open_duration), openTime, onOpenTimeChange, Modifier.weight(1f))
                        NumberField(stringResource(R.string.hold_duration), waitTime, onWaitTimeChange, Modifier.weight(1f))
                        NumberField(stringResource(R.string.close_duration), closeTime, onCloseTimeChange, Modifier.weight(1f))
                    }
                }
            }
        }
        item {
            MiuixTextButton(
                text = stringResource(R.string.complete_pairing),
                onClick = onComplete,
                modifier = Modifier
                    .padding(horizontal = 12.dp)
                    .fillMaxWidth(),
                colors = ButtonDefaults.textButtonColorsPrimary(),
            )
        }
    }
}
