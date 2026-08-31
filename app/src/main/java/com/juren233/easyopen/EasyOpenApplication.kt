package com.juren233.easyopen

import android.app.Application
import com.juren233.easyopen.ble.BleDoorController

/** Process-level owners shared by the launcher and NFC entry activities. */
class EasyOpenApplication : Application() {
    val bleDoorController: BleDoorController by lazy { BleDoorController(this) }
}
