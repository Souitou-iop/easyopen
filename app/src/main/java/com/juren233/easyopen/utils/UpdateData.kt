package com.juren233.easyopen.utils

import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.withContext
import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable
import kotlinx.serialization.decodeFromString
import kotlinx.serialization.json.Json
import java.net.HttpURLConnection
import java.net.URL

data class AvailableUpdate(
    val versionName: String,
    val versionCode: Long,
    val releaseUrl: String = "https://github.com/juren233/easyopen/releases/latest",
) {
    /** The banner intentionally shows the human-facing version, not the internal build number. */
    val displayVersion: String = "v$versionName"
}

@Serializable
private data class GitHubLatestRelease(
    @SerialName("tag_name") val tagName: String,
    @SerialName("html_url") val htmlUrl: String? = null,
    val assets: List<GitHubReleaseAsset> = emptyList(),
)

@Serializable
private data class GitHubReleaseAsset(
    val name: String,
)

/** Fetches the latest stable GitHub Release and exposes it for the home-page notice. */
object UpdateData {
    private const val LATEST_RELEASE_API =
        "https://api.github.com/repos/juren233/easyopen/releases/latest"
    private const val LATEST_RELEASE_PAGE =
        "https://github.com/juren233/easyopen/releases/latest"
    private val json = Json { ignoreUnknownKeys = true }

    private val _availableUpdate = MutableStateFlow<AvailableUpdate?>(null)
    val availableUpdate = _availableUpdate.asStateFlow()

    suspend fun refresh(
        currentVersionName: String,
        currentVersionCode: Long,
    ) {
        runCatching {
            fetchLatestRelease()?.takeIf { latest ->
                isUpdateAvailable(
                    latestVersionName = latest.versionName,
                    latestVersionCode = latest.versionCode,
                    currentVersionName = currentVersionName,
                    currentVersionCode = currentVersionCode,
                )
            }
        }.onSuccess { latest ->
            _availableUpdate.value = latest
        }
    }

    private suspend fun fetchLatestRelease(): AvailableUpdate? = withContext(Dispatchers.IO) {
        val connection = URL(LATEST_RELEASE_API).openConnection() as HttpURLConnection
        try {
            connection.requestMethod = "GET"
            connection.connectTimeout = 8_000
            connection.readTimeout = 8_000
            connection.useCaches = false
            connection.setRequestProperty("Accept", "application/vnd.github+json")
            connection.setRequestProperty("User-Agent", "EasyOpen-Android")
            connection.setRequestProperty("X-GitHub-Api-Version", "2022-11-28")

            val responseCode = connection.responseCode
            if (responseCode !in 200..299) {
                throw IllegalStateException("GitHub latest release request failed: HTTP $responseCode")
            }

            val release = connection.inputStream.bufferedReader().use { reader ->
                json.decodeFromString<GitHubLatestRelease>(reader.readText())
            }
            val versionName = parseReleaseVersionName(release.tagName) ?: return@withContext null
            val versionCode = extractReleaseVersionCode(
                assetNames = release.assets.map(GitHubReleaseAsset::name),
                versionName = versionName,
            ) ?: return@withContext null

            AvailableUpdate(
                versionName = versionName,
                versionCode = versionCode,
                releaseUrl = release.htmlUrl ?: LATEST_RELEASE_PAGE,
            )
        } finally {
            connection.disconnect()
        }
    }

    internal fun isUpdateAvailable(
        latestVersionName: String,
        latestVersionCode: Long,
        currentVersionName: String,
        currentVersionCode: Long,
    ): Boolean {
        if (parseVersionParts(latestVersionName) == null) return false
        if (parseVersionParts(currentVersionName) == null) return false
        return latestVersionCode > currentVersionCode
    }

    internal fun extractReleaseVersionCode(
        assetNames: List<String>,
        versionName: String,
    ): Long? {
        val versionCodeRegex = Regex(
            """v${Regex.escape(versionName)}-(\d+)\.apk$""",
            RegexOption.IGNORE_CASE,
        )
        return assetNames
            .sortedBy { assetName -> if (assetName.contains("release", ignoreCase = true)) 0 else 1 }
            .firstNotNullOfOrNull { assetName ->
                versionCodeRegex.find(assetName.trim())
                    ?.groupValues
                    ?.getOrNull(1)
                    ?.toLongOrNull()
            }
    }

    private fun parseReleaseVersionName(tagName: String): String? {
        val match = Regex("^v(\\d+\\.\\d+\\.\\d+)$").matchEntire(tagName.trim())
            ?: return null
        return match.groupValues[1]
    }

    private fun parseVersionParts(versionName: String): List<Int>? {
        val normalized = versionName.trim()
            .removePrefix("v")
            .substringBefore('-')
            .substringBefore('+')
        if (!normalized.matches(Regex("\\d+\\.\\d+\\.\\d+"))) return null
        return normalized.split('.').mapNotNull(String::toIntOrNull)
    }
}
