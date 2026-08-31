package com.juren233.easyopen.ui

import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.PaddingValues
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.unit.dp
import com.juren233.easyopen.R
import com.juren233.easyopen.ble.BleDoorController
import com.juren233.easyopen.ble.BleState
import com.juren233.easyopen.ble.DiscoveredDevice
import top.yukonga.miuix.kmp.preference.ArrowPreference
import top.yukonga.miuix.kmp.basic.BasicComponent
import top.yukonga.miuix.kmp.basic.ButtonDefaults
import top.yukonga.miuix.kmp.basic.Card
import top.yukonga.miuix.kmp.basic.SmallTitle
import top.yukonga.miuix.kmp.basic.TextButton as MiuixTextButton

@Composable
internal fun PairingDiscoveryPage(
    innerPadding: PaddingValues,
    listState: androidx.compose.foundation.lazy.LazyListState,
    existingDeviceCount: Int,
    state: BleState,
    devices: List<DiscoveredDevice>,
    pairingInProgress: Boolean,
    errorMessage: String?,
    controller: BleDoorController,
    onOpenBluetoothSettings: () -> Unit,
    onSelectDevice: (DiscoveredDevice) -> Unit,
) {
    LazyColumn(
        state = listState,
        modifier = Modifier.fillMaxSize(),
        contentPadding = PaddingValues(
            top = innerPadding.calculateTopPadding(),
            bottom = innerPadding.calculateBottomPadding() + 24.dp,
        ),
    ) {
        item {
            SmallTitle(
                text = stringResource(
                    if (existingDeviceCount == 0) R.string.pair_opener_section else R.string.add_another_opener_section,
                ),
            )
        }
        item {
            Card(
                modifier = Modifier
                    .padding(horizontal = 12.dp)
                    .padding(bottom = 12.dp)
                    .fillMaxWidth(),
            ) {
                Column {
                    BasicComponent(
                        title = stringResource(R.string.search_nearby_openers),
                        summary = when {
                            pairingInProgress -> stringResource(R.string.pairing_password_in_progress)
                            state is BleState.Scanning -> stringResource(R.string.searching)
                            errorMessage != null -> errorMessage
                            devices.isEmpty() -> stringResource(R.string.keep_opener_powered_nearby)
                            else -> stringResource(R.string.found_openers, devices.size)
                        },
                    )
                    if (!controller.isBluetoothEnabled()) {
                        MiuixTextButton(
                            text = stringResource(R.string.open_bluetooth_settings),
                            onClick = onOpenBluetoothSettings,
                            modifier = Modifier
                                .fillMaxWidth()
                                .padding(horizontal = 16.dp, vertical = 4.dp),
                            colors = ButtonDefaults.textButtonColorsPrimary(),
                        )
                    }
                    MiuixTextButton(
                        text = stringResource(
                            if (state is BleState.Scanning) R.string.search_again else R.string.start_search,
                        ),
                        onClick = { controller.startScan() },
                        enabled = !pairingInProgress,
                        modifier = Modifier
                            .fillMaxWidth()
                            .padding(horizontal = 16.dp, vertical = 8.dp),
                        colors = ButtonDefaults.textButtonColorsPrimary(),
                    )
                }
            }
        }
        item {
            SmallTitle(text = stringResource(R.string.search_results))
        }
        if (devices.isEmpty()) {
            item {
                Card(
                    modifier = Modifier
                        .padding(horizontal = 12.dp)
                        .padding(bottom = 12.dp)
                        .fillMaxWidth(),
                ) {
                    BasicComponent(
                        title = stringResource(R.string.no_opener_found),
                        summary = stringResource(R.string.no_opener_found_summary),
                    )
                }
            }
        } else {
            item {
                Card(
                    modifier = Modifier
                        .padding(horizontal = 12.dp)
                        .padding(bottom = 12.dp)
                        .fillMaxWidth(),
                ) {
                    Column {
                        devices.forEach { device ->
                            ArrowPreference(
                                title = device.name,
                                summary = stringResource(R.string.device_signal_summary, device.device.address, device.rssi),
                                enabled = !pairingInProgress,
                                onClick = { onSelectDevice(device) },
                            )
                        }
                    }
                }
            }
        }
    }
}
