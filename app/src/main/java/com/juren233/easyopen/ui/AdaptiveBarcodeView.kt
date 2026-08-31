package com.juren233.easyopen.ui

import android.content.Context
import android.graphics.Rect
import com.journeyapps.barcodescanner.BarcodeView

/**
 * Keeps the square camera presentation while decoding the complete source frame.
 *
 * JourneyApps normally derives a square framing rectangle from the view bounds.
 * That makes a QR code disappear from the decoder as soon as it is too large or
 * sits outside the square. The UI border remains a guide, but recognition uses
 * the full scaled preview surface so the code can be located automatically.
 */
internal class AdaptiveBarcodeView(context: Context) : BarcodeView(context) {
    override fun calculateFramingRect(container: Rect, surface: Rect): Rect {
        return Rect(surface)
    }
}
