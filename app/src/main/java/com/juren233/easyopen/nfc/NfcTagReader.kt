package com.juren233.easyopen.nfc

import android.app.Activity
import android.app.PendingIntent
import android.content.Intent
import android.nfc.NdefMessage
import android.nfc.NfcAdapter
import android.nfc.Tag
import android.os.Build
import android.os.SystemClock
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.cancel
import kotlinx.coroutines.channels.Channel
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.receiveAsFlow
import kotlinx.coroutines.launch

@Suppress("DEPRECATION")
private val NFC_INTENT_ACTIONS = setOf(
    NfcAdapter.ACTION_NDEF_DISCOVERED,
    NfcAdapter.ACTION_TECH_DISCOVERED,
    NfcAdapter.ACTION_TAG_DISCOVERED,
)

data class NfcTagEvent(
    val tag: Tag,
    val ndefMessage: NdefMessage?,
    val ndefReadSucceeded: Boolean,
) {
    val isUnlockCommand: Boolean
        get() = ndefMessage?.records?.any(NfcCommand::isUnlockRecord) == true
}

data class NfcWriteRequest(
    val tag: Tag,
    val originalMessage: NdefMessage?,
    val originalReadSucceeded: Boolean,
)

data class NfcReaderState(
    val supported: Boolean,
    val enabled: Boolean,
)

/** Delivers physical NFC tags to the app and reads their current NDEF content. */
class NfcTagReader(
    private val activity: Activity,
    private val duplicateWindowMs: Long = DEFAULT_DUPLICATE_WINDOW_MS,
) {
    private val adapter = NfcAdapter.getDefaultAdapter(activity)
    private val eventsChannel = Channel<NfcTagEvent>(capacity = Channel.BUFFERED)
    private val ioScope = CoroutineScope(SupervisorJob() + Dispatchers.IO)
    private val _state = MutableStateFlow(
        NfcReaderState(
            supported = adapter != null,
            enabled = adapter?.isEnabled == true,
        ),
    )
    private val dispatchPendingIntent by lazy {
        val flags = PendingIntent.FLAG_UPDATE_CURRENT or
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
                PendingIntent.FLAG_MUTABLE
            } else {
                0
            }
        PendingIntent.getActivity(
            activity,
            0,
            Intent(activity, activity::class.java).addFlags(Intent.FLAG_ACTIVITY_SINGLE_TOP),
            flags,
        )
    }
    private val lock = Any()
    @Volatile
    private var foregroundDispatchActive = false
    private var lastTagKey: String? = null
    private var lastUnlockCommand = false
    private var lastDiscoveredAt = 0L

    val events: Flow<NfcTagEvent> = eventsChannel.receiveAsFlow()
    val state: StateFlow<NfcReaderState> = _state.asStateFlow()

    fun onResume() {
        val nfcAdapter = adapter ?: return
        if (foregroundDispatchActive) return
        _state.value = NfcReaderState(supported = true, enabled = nfcAdapter.isEnabled)
        if (!nfcAdapter.isEnabled) return

        runCatching {
            nfcAdapter.enableForegroundDispatch(activity, dispatchPendingIntent, null, null)
            foregroundDispatchActive = true
        }
    }

    fun onPause() {
        if (foregroundDispatchActive) {
            runCatching { adapter?.disableForegroundDispatch(activity) }
            foregroundDispatchActive = false
        }
        refreshState()
    }

    fun close() {
        onPause()
        ioScope.cancel()
        eventsChannel.close()
    }

    /** Handles an NFC intent delivered to MainActivity by foreground dispatch. */
    fun handleIntent(intent: Intent?) {
        val action = intent?.action ?: return
        if (action !in NFC_INTENT_ACTIONS) return
        val tag = tagFromIntent(intent) ?: return
        val messageFromDispatch = NfcCommand.messageFromIntent(intent)
        if (messageFromDispatch != null) {
            processTag(tag, messageFromDispatch, ndefReadSucceeded = true)
        } else {
            // Wildcard foreground dispatch normally delivers ACTION_TAG_DISCOVERED,
            // so read the tag on IO before deciding whether it is an unlock tag.
            ioScope.launch {
                val readResult = NfcCommand.readMessage(tag)
                processTag(tag, readResult.getOrNull(), readResult.isSuccess)
            }
        }
    }

    private fun processTag(
        tag: Tag,
        ndefMessage: NdefMessage?,
        ndefReadSucceeded: Boolean,
    ) {
        val now = SystemClock.elapsedRealtime()
        val tagKey = tagKey(tag)
        val isUnlockCommand = ndefMessage?.records?.any(NfcCommand::isUnlockRecord) == true
        synchronized(lock) {
            if (
                tagKey == lastTagKey &&
                isUnlockCommand == lastUnlockCommand &&
                now - lastDiscoveredAt < duplicateWindowMs
            ) {
                return
            }
            lastTagKey = tagKey
            lastUnlockCommand = isUnlockCommand
            lastDiscoveredAt = now
        }
        eventsChannel.trySend(NfcTagEvent(tag, ndefMessage, ndefReadSucceeded))
    }

    private fun refreshState() {
        _state.value = NfcReaderState(
            supported = adapter != null,
            enabled = adapter?.isEnabled == true,
        )
    }

    private fun tagKey(tag: Tag): String = tag.id.joinToString(separator = ",")
        .ifBlank { tag.techList.joinToString(separator = "|") }

    @Suppress("DEPRECATION")
    private fun tagFromIntent(intent: Intent): Tag? {
        return if (Build.VERSION.SDK_INT >= 33) {
            intent.getParcelableExtra(NfcAdapter.EXTRA_TAG, Tag::class.java)
        } else {
            intent.getParcelableExtra(NfcAdapter.EXTRA_TAG)
        }
    }

    private companion object {
        const val DEFAULT_DUPLICATE_WINDOW_MS = 2_000L
    }
}
