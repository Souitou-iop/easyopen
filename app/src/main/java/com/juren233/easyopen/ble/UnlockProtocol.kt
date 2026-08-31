package com.juren233.easyopen.ble

import java.security.MessageDigest
import javax.crypto.Cipher
import javax.crypto.spec.SecretKeySpec

/** Command generator reconstructed from the original com.macronum.bledemo binary. */
object UnlockProtocol {
    private const val AES_KEY = "Fx4k6AWivOsLE4NI"
    private const val PASSWORD_PREFIX = "A:PW;P:"
    private const val OPEN_PREFIX = "A:OPEN;P:"
    private val HEX_16 = Regex("[0-9a-fA-F]{16}")
    private val HEX_32 = Regex("[0-9a-fA-F]{32}")

    /** Original pairing command: timestamp + password token + A:PW;P:<password token>; */
    fun buildPasswordPacket(password: String, epochSeconds: Long = System.currentTimeMillis() / 1_000): ByteArray {
        require(password.matches(Regex("^[0-9]{6}$"))) { "开门器密码必须是 6 位数字" }
        val token = passwordToken(password)
        return encrypt("$epochSeconds$token$PASSWORD_PREFIX$token;".toByteArray(Charsets.UTF_8))
    }

    fun buildOpenPacket(profile: com.juren233.easyopen.data.DeviceProfile, epochSeconds: Long = System.currentTimeMillis() / 1_000): ByteArray {
        require(profile.password.isNotBlank()) { "请先配置开门器密码" }
        val sign = if (profile.attribute == 1) "-" else "+"
        val command = "$OPEN_PREFIX$sign ${profile.openTimeMs},${profile.waitTimeMs},${profile.closeTimeMs};"
        val token = passwordToken(profile.password)
        return encrypt("$epochSeconds$token$command".toByteArray(Charsets.UTF_8))
    }

    private fun encrypt(plaintext: ByteArray): ByteArray {
        val paddedLength = ((plaintext.size + 15) / 16) * 16
        val cipher = Cipher.getInstance("AES/ECB/NoPadding")
        cipher.init(Cipher.ENCRYPT_MODE, SecretKeySpec(AES_KEY.toByteArray(Charsets.UTF_8), "AES"))
        return cipher.doFinal(plaintext.copyOf(paddedLength))
    }

    fun passwordToken(password: String): String = when {
        password.matches(HEX_16) -> password
        password.matches(HEX_32) -> password.substring(8, 24)
        else -> md5(password).substring(8, 24)
    }

    fun md5(value: String): String {
        val digest = MessageDigest.getInstance("MD5").digest(value.toByteArray(Charsets.UTF_8))
        return digest.joinToString(separator = "") { "%02x".format(it.toInt() and 0xff) }
    }


    /** Compatibility entry point for callers that historically used UnlockProtocol for this parser. */
    fun parseBatteryLevel(scanRecord: ByteArray): Int? = BatteryAdvertisementParser.parse(scanRecord)

    fun responseText(bytes: ByteArray): String = bytes.toString(Charsets.UTF_8)
        .filter { it == '\t' || it == '\n' || it == '\r' || it in ' '..'~' }
        .trim()

    fun responseHex(bytes: ByteArray): String = bytes.joinToString(separator = "") { "%02X".format(it.toInt() and 0xff) }

    fun isSuccess(bytes: ByteArray): Boolean {
        val ascii = responseText(bytes).uppercase()
        val hex = responseHex(bytes)
        return ascii.contains("OK") || hex.contains("4F4B")
    }

    fun isFailure(bytes: ByteArray): Boolean {
        val ascii = responseText(bytes).uppercase()
        val hex = responseHex(bytes)
        return ascii.contains("ERROR") || ascii.contains("FAIL") || hex.contains("4552524F52")
    }

    fun responseSummary(bytes: ByteArray): String {
        if (bytes.isEmpty()) return "空响应"
        val ascii = responseText(bytes)
        return if (ascii.isNotBlank()) ascii else "HEX ${responseHex(bytes)}"
    }
}
