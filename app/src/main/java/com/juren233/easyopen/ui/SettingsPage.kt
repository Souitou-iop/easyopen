package com.juren233.easyopen.ui

import android.widget.Toast
import androidx.activity.compose.rememberLauncherForActivityResult
import androidx.activity.result.contract.ActivityResultContracts
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.PaddingValues
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.runtime.Composable
import androidx.compose.runtime.rememberCoroutineScope
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.unit.dp
import com.juren233.easyopen.R
import com.juren233.easyopen.data.AppSettings
import com.juren233.easyopen.data.DeviceProfile
import com.juren233.easyopen.data.TransferCodec
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import top.yukonga.miuix.kmp.basic.Card
import top.yukonga.miuix.kmp.basic.Icon
import top.yukonga.miuix.kmp.basic.IconButton
import top.yukonga.miuix.kmp.basic.MiuixScrollBehavior
import top.yukonga.miuix.kmp.basic.Scaffold
import top.yukonga.miuix.kmp.basic.SmallTitle
import top.yukonga.miuix.kmp.basic.TopAppBar
import top.yukonga.miuix.kmp.icon.MiuixIcons
import top.yukonga.miuix.kmp.icon.extended.Back
import top.yukonga.miuix.kmp.preference.ArrowPreference
import top.yukonga.miuix.kmp.preference.SwitchPreference
import top.yukonga.miuix.kmp.preference.WindowDropdownPreference

@Composable
internal fun SettingsPage(
    devices: List<DeviceProfile>,
    activeAddress: String,
    settings: AppSettings,
    onBack: () -> Unit,
    onThemeModeChange: (Int) -> Unit,
    onMonetChange: (Boolean) -> Unit,
    onAutoUnlockOnAppOpenChange: (Boolean) -> Unit,
    onAutoConnectEnabledChange: (Boolean) -> Unit,
    onAutoConnectRangeChange: (Int) -> Unit,
    onCustomAutoConnectRssiChange: (Int) -> Unit,
    onRestore: (TransferCodec.BackupSnapshot) -> Unit,
) {
    val context = LocalContext.current
    val scope = rememberCoroutineScope()
    val scrollBehavior = MiuixScrollBehavior()
    val backupSuccessMessage = stringResource(R.string.backup_success)
    val backupFailedMessage = stringResource(R.string.backup_failed)
    val restoreSuccessMessage = stringResource(R.string.restore_success)
    val restoreFailedMessage = stringResource(R.string.restore_failed)
    val themeOptions = listOf(
        stringResource(R.string.theme_system),
        stringResource(R.string.theme_light),
        stringResource(R.string.theme_dark),
    )

    val backupLauncher = rememberLauncherForActivityResult(
        contract = ActivityResultContracts.CreateDocument("application/json"),
    ) { uri ->
        if (uri == null) return@rememberLauncherForActivityResult
        scope.launch {
            val raw = withContext(Dispatchers.Default) {
                TransferCodec.encodeBackup(
                    devices = devices,
                    activeAddress = activeAddress,
                    themeMode = settings.themeMode,
                    monetEnabled = settings.monetEnabled,
                    autoUnlockOnAppOpen = settings.autoUnlockOnAppOpen,
                    autoConnectEnabled = settings.autoConnectEnabled,
                    autoConnectRange = settings.autoConnectRange,
                    customAutoConnectRssi = settings.customAutoConnectRssi,
                )
            }
            val saved = runCatching {
                withContext(Dispatchers.IO) {
                    context.contentResolver.openOutputStream(uri)?.use { output ->
                        output.write(raw.toByteArray(Charsets.UTF_8))
                    } ?: error("output stream unavailable")
                }
            }.isSuccess
            Toast.makeText(
                context,
                if (saved) backupSuccessMessage else backupFailedMessage,
                Toast.LENGTH_SHORT,
            ).show()
        }
    }
    val restoreLauncher = rememberLauncherForActivityResult(
        contract = ActivityResultContracts.OpenDocument(),
    ) { uri ->
        if (uri == null) return@rememberLauncherForActivityResult
        scope.launch {
            val snapshot = runCatching {
                withContext(Dispatchers.IO) {
                    context.contentResolver.openInputStream(uri)?.use { input ->
                        TransferCodec.decodeBackup(input.bufferedReader(Charsets.UTF_8).readText())
                    }
                }
            }.getOrNull()
            if (snapshot != null) {
                onRestore(snapshot)
            }
            Toast.makeText(
                context,
                if (snapshot != null) restoreSuccessMessage else restoreFailedMessage,
                Toast.LENGTH_SHORT,
            ).show()
        }
    }

    Scaffold(
        topBar = {
            TopAppBar(
                title = stringResource(R.string.settings_title),
                scrollBehavior = scrollBehavior,
                navigationIcon = {
                    IconButton(onClick = onBack) {
                        Icon(imageVector = MiuixIcons.Back, contentDescription = stringResource(R.string.back))
                    }
                },
            )
        },
    ) { innerPadding ->
        LazyColumn(
            modifier = Modifier.fillMaxSize(),
            contentPadding = PaddingValues(
                top = innerPadding.calculateTopPadding(),
                bottom = innerPadding.calculateBottomPadding() + 24.dp,
            ),
        ) {
            item { SmallTitle(text = stringResource(R.string.personalization_category)) }
            item {
                Card(
                    modifier = Modifier
                        .padding(horizontal = 12.dp)
                        .padding(bottom = 12.dp)
                        .fillMaxWidth(),
                ) {
                    Column(verticalArrangement = Arrangement.spacedBy(0.dp)) {
                        WindowDropdownPreference(
                            title = stringResource(R.string.theme_color_title),
                            items = themeOptions,
                            selectedIndex = settings.themeMode,
                            onSelectedIndexChange = onThemeModeChange,
                        )
                        SwitchPreference(
                            title = stringResource(R.string.monet_color_title),
                            checked = settings.monetEnabled,
                            onCheckedChange = onMonetChange,
                        )
                    }
                }
            }
            item {
                AutomationSettingsSection(
                    settings = settings,
                    onAutoUnlockOnAppOpenChange = onAutoUnlockOnAppOpenChange,
                    onAutoConnectEnabledChange = onAutoConnectEnabledChange,
                    onAutoConnectRangeChange = onAutoConnectRangeChange,
                    onCustomAutoConnectRssiChange = onCustomAutoConnectRssiChange,
                )
            }
            item { SmallTitle(text = stringResource(R.string.data_category)) }
            item {
                Card(
                    modifier = Modifier
                        .padding(horizontal = 12.dp)
                        .padding(bottom = 12.dp)
                        .fillMaxWidth(),
                ) {
                    Column(verticalArrangement = Arrangement.spacedBy(0.dp)) {
                        ArrowPreference(
                            title = stringResource(R.string.backup_title),
                            onClick = {
                                backupLauncher.launch("easyopen_backup.json")
                            },
                        )
                        ArrowPreference(
                            title = stringResource(R.string.restore_title),
                            onClick = {
                                restoreLauncher.launch(arrayOf("application/json", "text/plain"))
                            },
                        )
                    }
                }
            }
        }
    }
}
