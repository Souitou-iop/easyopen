import SwiftUI

@main struct EasyOpenApp: App {
    @State private var store = AppStore()
    @State private var bluetooth = BluetoothManager()
    @Environment(\.scenePhase) private var scenePhase
    @State private var autoUnlockHandled = false
    var body: some Scene {
        WindowGroup {
            RootView(store: store, bluetooth: bluetooth)
                .onOpenURL(perform: handle)
                .onChange(of: scenePhase) { _, phase in
                    if phase == .active {
                        bluetooth.enterForeground(profile: store.activeDevice)
                        performAutoUnlockIfNeeded()
                        startMonitoringIfNeeded()
                    }
                    if phase == .background {
                        autoUnlockHandled = false
                        bluetooth.enterBackground()
                    }
                }
        }
    }
    private func handle(_ url: URL) {
        guard url.scheme == "easyopen", let host = url.host, host == "unlock" || host == "setup-nfc" else { return }
        let value = URLComponents(url: url, resolvingAgainstBaseURL: false)?.queryItems?.first(where: { $0.name == "device" })?.value
        // `easyopen://unlock` matches Android's `unlock_current=1` semantics.
        // The optional device query selects a specific imported iOS profile.
        let profile: DeviceProfile?
        if let value, !value.isEmpty {
            guard let id = UUID(uuidString: value) else { return }
            profile = store.devices.first(where: { $0.id == id })
        } else {
            profile = store.activeDevice
        }
        guard let profile else { return }
        store.activeDeviceID = profile.id
        if host == "setup-nfc" { return }
        guard store.nfcAutoUnlock else { return }
        unlock(profile.id)
    }
    private func startMonitoringIfNeeded() {
        guard store.autoConnectEnabled, let profile = store.activeDevice else { return }
        bluetooth.startMonitoring(profile: profile, minimumRSSI: store.customAutoConnectRssi)
    }

    private func performAutoUnlockIfNeeded() {
        guard store.autoUnlockOnAppOpen, !autoUnlockHandled, let profile = store.activeDevice else { return }
        autoUnlockHandled = true
        unlock(profile.id)
    }

    private func unlock(_ id: UUID) {
        guard let profile = store.devices.first(where: { $0.id == id }), let password = store.password(for: profile) else { return }
        Task {
            do { if bluetooth.state != .ready { try await bluetooth.connectIfNeeded(profile: profile) }; try await bluetooth.unlock(profile: profile, password: password) }
            catch { bluetooth.state = .failure(error.localizedDescription) }
        }
    }
}
