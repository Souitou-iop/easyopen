import SwiftUI
import UIKit
import CoreBluetooth
import UniformTypeIdentifiers
import PhotosUI
import Vision

struct RootView: View {
    @Bindable var store: AppStore
    @Bindable var bluetooth: BluetoothManager
    var body: some View {
        Group { if store.devices.isEmpty { OnboardingView(store: store, bluetooth: bluetooth) } else { MainTabView(store: store, bluetooth: bluetooth) } }
            .tint(.indigo)
    }
}

struct OnboardingView: View {
    @Bindable var store: AppStore; @Bindable var bluetooth: BluetoothManager
    @State private var showingAdd = false; @State private var showingScan = false
    var body: some View {
        NavigationStack { VStack(spacing: 24) {
            Spacer(); Image(systemName: "lock.shield.fill").font(.system(size: 72)).foregroundStyle(.indigo)
            Text("EasyOpen").font(.largeTitle.bold()); Text("本地蓝牙开门工具").foregroundStyle(.secondary); Spacer()
            Button { showingAdd = true } label: { Label("添加开锁器", systemImage: "plus.circle.fill").frame(maxWidth: .infinity) }.buttonStyle(.borderedProminent)
            Button { showingScan = true } label: { Label("扫码导入", systemImage: "qrcode.viewfinder").frame(maxWidth: .infinity) }.buttonStyle(.bordered)
            Text("开锁器密码只保存在本机 Keychain").font(.footnote).foregroundStyle(.secondary); Spacer().frame(height: 12)
        }.padding(28).navigationTitle("开始使用")
            .sheet(isPresented: $showingAdd) { AddOpenerView(store: store, bluetooth: bluetooth) }
            .sheet(isPresented: $showingScan) { ImportView(store: store) } }
    }
}

struct AddOpenerView: View {
    @Environment(\.dismiss) private var dismiss; @Bindable var store: AppStore; @Bindable var bluetooth: BluetoothManager
    @State private var password = ""; @State private var name = "我的开门器"; @State private var error: String?; @State private var pairing = false
    var body: some View { NavigationStack { List {
        Section("附近设备") { Button("扫描 YILA 开锁器") { bluetooth.scan() }; ForEach(bluetooth.discovered, id: \.identifier) { peripheral in Button { Task { await pair(peripheral) } } label: { VStack(alignment: .leading) { Text(bluetooth.names[peripheral.identifier] ?? peripheral.name ?? "未命名设备"); Text(peripheral.identifier.uuidString).font(.caption2).foregroundStyle(.secondary) } } } }
        Section("配对") { TextField("设备名称", text: $name); SecureField("6 位数字密码", text: $password).keyboardType(.numberPad); if pairing { ProgressView("正在配对…") }; if let error { Text(error).foregroundStyle(.red) } }
    }.navigationTitle("添加开锁器").toolbar { ToolbarItem(placement: .cancellationAction) { Button("取消") { dismiss() } } }
        .onAppear { bluetooth.scan() }
        .onDisappear { bluetooth.stopScan() }
    }
}
    private func pair(_ peripheral: CBPeripheral) async { guard password.range(of: "^[0-9]{6}$", options: .regularExpression) != nil else { error = AppError.invalidPassword.localizedDescription; return }; pairing = true; defer { pairing = false }; do { try await bluetooth.connect(peripheral); try await bluetooth.pair(password: password); try store.add(DeviceProfile(name: name, peripheralIdentifier: peripheral.identifier), password: password); dismiss() } catch { self.error = error.localizedDescription } }
}

struct ImportView: View {
    @Environment(\.dismiss) private var dismiss
    @Bindable var store: AppStore
    @State private var scanner = false
    @State private var selectedPhoto: PhotosPickerItem?
    @State private var error: String?
    @State private var pending: [ImportedProfile]?
    @State private var isDecodingPhoto = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                QRImportHero()
                VStack(spacing: 12) {
                    Button { scanner = true } label: {
                        Label("打开相机扫描", systemImage: "camera.viewfinder")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)

                    PhotosPicker(selection: $selectedPhoto, matching: .images) {
                        Label("从相册选择二维码", systemImage: "photo.on.rectangle")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.bordered)
                    .disabled(isDecodingPhoto)
                }
                if isDecodingPhoto { ProgressView("正在识别二维码…") }
                if let error { Label(error, systemImage: "exclamationmark.triangle.fill").foregroundStyle(.red).multilineTextAlignment(.center) }
                Spacer()
                Text("支持 EasyOpen Android/iOS 分享码。导入后仍需绑定对应的 iOS 蓝牙设备。")
                    .font(.footnote).foregroundStyle(.secondary).multilineTextAlignment(.center)
            }
            .padding(24)
            .navigationTitle("扫码导入")
            .toolbar { ToolbarItem(placement: .cancellationAction) { Button("关闭") { dismiss() } } }
            .sheet(isPresented: $scanner) {
                QRScannerView { value in
                    scanner = false
                    handlePayload(value)
                }
            }
            .onChange(of: selectedPhoto) { _, item in
                guard let item else { return }
                Task { await decodePhoto(item) }
            }
            .confirmationDialog("导入分享配置？", isPresented: Binding(get: { pending != nil }, set: { if !$0 { pending = nil } }), titleVisibility: .visible) {
                Button("导入") { if let pending { importProfiles(pending) } }
                Button("取消", role: .cancel) { pending = nil }
            } message: {
                Text("将导入 \(pending?.count ?? 0) 个开锁器，已有同 MAC 配置会更新，iOS 蓝牙绑定不会被覆盖。")
            }
        }
    }

    private func handlePayload(_ value: String) {
        guard let profiles = TransferCodec.decodeShare(value), !profiles.isEmpty else {
            error = AppError.importFailed.localizedDescription
            return
        }
        error = nil
        pending = profiles
    }

    @MainActor
    private func decodePhoto(_ item: PhotosPickerItem) async {
        isDecodingPhoto = true
        defer { isDecodingPhoto = false; selectedPhoto = nil }
        do {
            guard let data = try await item.loadTransferable(type: Data.self), let image = UIImage(data: data), let payload = QRCodeDecoder.decode(image: image) else {
                throw AppError.importFailed
            }
            handlePayload(payload)
        } catch {
            self.error = "未能从照片识别二维码，请选择清晰、完整的 EasyOpen 分享码。"
        }
    }

    private func importProfiles(_ profiles: [ImportedProfile]) {
        do {
            let snapshot = BackupSnapshot(devices: profiles, activeAddress: profiles[0].profile.legacyAddress ?? "", themeMode: store.themeMode, monetEnabled: store.monetEnabled, autoUnlockOnAppOpen: store.autoUnlockOnAppOpen, autoConnectEnabled: store.autoConnectEnabled, autoConnectRange: store.autoConnectRange, customAutoConnectRssi: store.customAutoConnectRssi)
            try store.importBackup(snapshot)
            dismiss()
        } catch { self.error = error.localizedDescription }
    }
}

private struct QRImportHero: View {
    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: "qrcode.viewfinder")
                .font(.system(size: 54, weight: .medium))
                .symbolRenderingMode(.hierarchical)
                .foregroundStyle(.indigo)
            Text("导入 EasyOpen 分享码").font(.title2.bold())
            Text("可以使用相机扫描，也可以从相册选择已有的二维码照片。")
                .font(.subheadline).foregroundStyle(.secondary).multilineTextAlignment(.center)
        }
    }
}

private enum QRCodeDecoder {
    static func decode(image: UIImage) -> String? {
        guard let cgImage = image.cgImage else { return nil }
        var result: String?
        let request = VNDetectBarcodesRequest { request, _ in
            result = (request.results as? [VNBarcodeObservation])?.first(where: { $0.symbology == .qr })?.payloadStringValue
        }
        request.symbologies = [.qr]
        try? VNImageRequestHandler(cgImage: cgImage, orientation: orientation(for: image), options: [:]).perform([request])
        return result
    }

    private static func orientation(for image: UIImage) -> CGImagePropertyOrientation {
        switch image.imageOrientation {
        case .up: return .up
        case .down: return .down
        case .left: return .left
        case .right: return .right
        case .upMirrored: return .upMirrored
        case .downMirrored: return .downMirrored
        case .leftMirrored: return .leftMirrored
        case .rightMirrored: return .rightMirrored
        @unknown default: return .up
        }
    }
}

struct MainTabView: View {
    @Bindable var store: AppStore; @Bindable var bluetooth: BluetoothManager
    var body: some View { TabView { HomeView(store: store, bluetooth: bluetooth).tabItem { Label("主页", systemImage: "lock.fill") }; SettingsView(store: store, bluetooth: bluetooth).tabItem { Label("设定", systemImage: "gearshape.fill") } }.onAppear {
        guard store.autoConnectEnabled, let profile = store.activeDevice else { return }
        bluetooth.startMonitoring(profile: profile, minimumRSSI: store.customAutoConnectRssi)
    }.onChange(of: bluetooth.batteries) { _, values in
        for (identifier, level) in values { store.updateBattery(for: identifier, level: level) }
    } }
}

struct HomeView: View {
    @Bindable var store: AppStore
    @Bindable var bluetooth: BluetoothManager
    @State private var error: String?
    @State private var isUnlocking = false
    @State private var successFeedbackTrigger = 0
    @State private var failureFeedbackTrigger = 0

    private var currentState: LockVisualState {
        switch bluetooth.state {
        case .unlocking: return .unlocking
        case .success: return .unlocked
        default: return .locked
        }
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                if let profile = store.activeDevice {
                    deviceHeader(profile)
                    LockActionCard(state: currentState, action: { Task { await unlock(profile) } })
                        .disabled(isUnlocking)
                        .sensoryFeedback(.success, trigger: successFeedbackTrigger)
                        .sensoryFeedback(.error, trigger: failureFeedbackTrigger)
                    statusCard(profile)
                } else {
                    ContentUnavailableView("尚未添加开锁器", systemImage: "lock.slash", description: Text("请先在设定页添加设备。"))
                }
                Spacer(minLength: 0)
            }
            .padding(.horizontal, 20)
            .padding(.top, 12)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .background(Color(uiColor: .systemGroupedBackground))
            .navigationTitle("EasyOpen")
            .toolbar { ToolbarItem(placement: .topBarTrailing) { connectionMenu } }
        }
    }

    @ViewBuilder private func deviceHeader(_ profile: DeviceProfile) -> some View {
        VStack(alignment: .leading, spacing: 14) {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 5) {
                    Text("当前开锁器").font(.subheadline).foregroundStyle(.secondary)
                    Text(profile.name).font(.title.bold()).lineLimit(1)
                }
                Spacer()
                if store.devices.count > 1 { devicePicker }
            }
            HStack(spacing: 8) {
                StatusPill(title: error ?? bluetooth.state.label, icon: error == nil ? nil : "exclamationmark.triangle.fill", color: error == nil ? statusColor : .red)
                if let battery = profile.batteryLevel { StatusPill(title: battery.batteryLabel, icon: batteryIcon(battery), color: .secondary) }
            }
        }
    }

    private var devicePicker: some View {
        Menu {
            ForEach(store.devices) { device in
                Button { store.activeDeviceID = device.id } label: {
                    Label(device.name, systemImage: device.id == store.activeDeviceID ? "checkmark" : "lock.fill")
                }
            }
        } label: { Image(systemName: "chevron.up.chevron.down").font(.headline).padding(10).background(.thinMaterial, in: Circle()) }
    }

    private func statusCard(_ profile: DeviceProfile) -> some View {
        VStack(alignment: .leading, spacing: 14) {
            Label("设备参数", systemImage: "slider.horizontal.3").font(.headline)
            HStack(spacing: 0) {
                ParameterMetric(title: "方向", value: profile.attribute == 0 ? "正向 +" : "反向 −")
                Divider().frame(height: 34)
                ParameterMetric(title: "开启", value: "\(profile.openTimeMs) ms")
                Divider().frame(height: 34)
                ParameterMetric(title: "保持", value: "\(profile.waitTimeMs) ms")
                Divider().frame(height: 34)
                ParameterMetric(title: "关闭", value: "\(profile.closeTimeMs) ms")
            }
        }
        .padding(18)
        .background(Color(uiColor: .secondarySystemGroupedBackground), in: RoundedRectangle(cornerRadius: 22, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 22, style: .continuous)
                .strokeBorder(Color.white.opacity(0.08), lineWidth: 1)
        )
        .shadow(color: .black.opacity(0.04), radius: 12, y: 4)
    }

    private var connectionMenu: some View {
        Menu {
            Button("重新连接", systemImage: "arrow.clockwise") { if let profile = store.activeDevice { Task { try? await bluetooth.connectIfNeeded(profile: profile) } } }
            if store.activeDevice != nil, store.devices.count > 1 {
                Menu("切换开锁器", systemImage: "arrow.left.arrow.right") {
                    ForEach(store.devices) { device in Button(device.name) { store.activeDeviceID = device.id } }
                }
            }
        } label: { Image(systemName: "ellipsis.circle") }
    }

    private var statusColor: Color {
        switch bluetooth.state { case .ready, .success: return .green; case .failure: return .red; case .unlocking: return .indigo; default: return .secondary }
    }

    private func batteryIcon(_ level: Int) -> String { level >= 5 ? "battery.100percent" : level >= 4 ? "battery.75percent" : level >= 3 ? "battery.50percent" : level >= 2 ? "battery.25percent" : "battery.0percent" }

    private func unlock(_ profile: DeviceProfile) async {
        guard !isUnlocking else { return }
        isUnlocking = true; error = nil
        defer { isUnlocking = false }
        do {
            if bluetooth.state != .ready { try await bluetooth.connectIfNeeded(profile: profile) }
            guard let password = store.password(for: profile), !password.isEmpty else { throw AppError.invalidPassword }
            try await bluetooth.unlock(profile: profile, password: password)
            successFeedbackTrigger += 1
        } catch {
            self.error = error.localizedDescription
            failureFeedbackTrigger += 1
        }
    }
}

private enum LockVisualState: Hashable { case locked, unlocking, unlocked }

private struct LockActionCard: View {
    let state: LockVisualState
    let action: () -> Void
    @State private var animationTrigger = 0

    var body: some View {
        Button(action: action) {
            VStack(spacing: 18) {
                ZStack {
                    Circle().fill(gradient).frame(width: 220, height: 220)
                    Circle().stroke(.white.opacity(0.25), lineWidth: 1).frame(width: 220, height: 220)
                    LockGlyph(state: state, trigger: animationTrigger)
                }
                .animation(.easeInOut(duration: 0.5), value: state)
                VStack(spacing: 5) {
                    Text(title).font(.title2.bold())
                    Text(subtitle).font(.subheadline).foregroundStyle(.secondary)
                }
                .animation(.easeInOut(duration: 0.35), value: state)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 22)
            .background(Color(uiColor: .secondarySystemGroupedBackground), in: RoundedRectangle(cornerRadius: 30, style: .continuous))
            .overlay(
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .strokeBorder(Color.white.opacity(0.08), lineWidth: 1)
            )
            .shadow(color: .black.opacity(0.08), radius: 20, y: 8)
        }
        .buttonStyle(PressableLockButtonStyle())
        .onChange(of: state) { _, newValue in
            if newValue == .unlocking { animationTrigger += 1 }
        }
    }

    private var title: String { switch state { case .locked: "一键开锁"; case .unlocking: "正在开锁…"; case .unlocked: "已开锁" } }
    private var subtitle: String { switch state { case .locked: "点击连接并发送开锁指令"; case .unlocking: "钥匙正在插入并转动，请稍候"; case .unlocked: "设备已收到开锁指令" } }
    private var gradient: LinearGradient { switch state { case .locked: LinearGradient(colors: [.indigo, .blue], startPoint: .topLeading, endPoint: .bottomTrailing); case .unlocking: LinearGradient(colors: [.purple, .indigo], startPoint: .topLeading, endPoint: .bottomTrailing); case .unlocked: LinearGradient(colors: [.green, .mint], startPoint: .topLeading, endPoint: .bottomTrailing) } }
}

private struct PressableLockButtonStyle: ButtonStyle {
    @State private var didSendPressFeedback = false

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.96 : 1)
            .offset(y: configuration.isPressed ? 4 : 0)
            .shadow(
                color: .black.opacity(configuration.isPressed ? 0.04 : 0.08),
                radius: configuration.isPressed ? 8 : 20,
                y: configuration.isPressed ? 3 : 8
            )
            .animation(.spring(response: 0.28, dampingFraction: 0.7), value: configuration.isPressed)
            .onChange(of: configuration.isPressed) { _, isPressed in
                if isPressed {
                    UIImpactFeedbackGenerator(style: .light).impactOccurred()
                    didSendPressFeedback = true
                } else {
                    didSendPressFeedback = false
                }
            }
    }
}

private struct LockGlyph: View {
    private enum KeyPhase { case hidden, entering, inserted, turning, finished }

    let state: LockVisualState
    let trigger: Int
    @State private var keyPhase: KeyPhase = .hidden

    var body: some View {
        ZStack {
            Image(systemName: state == .unlocked ? "lock.open.fill" : "lock.fill")
                .font(.system(size: 62, weight: .semibold))
                .foregroundStyle(.white)
                .contentTransition(.symbolEffect(.replace.downUp))
                .symbolEffect(.bounce, value: trigger)
                .scaleEffect(state == .unlocked ? 1.04 : 1)
                .animation(.spring(response: 0.45, dampingFraction: 0.72), value: state)

            // The key is deliberately absent in the resting state. During unlocking it
            // travels upward from below the lock, settles into the keyhole, then turns.
            if state == .unlocking || keyPhase == .finished {
                Image(systemName: "key.fill")
                    .font(.system(size: 42, weight: .bold))
                    .foregroundStyle(.white)
                    .rotationEffect(.degrees(keyRotation))
                    .offset(y: keyOffset)
                    .opacity(keyOpacity)
                    .scaleEffect(keyPhase == .turning ? 1.06 : 1)
                    .animation(.spring(response: 0.48, dampingFraction: 0.78), value: keyPhase)
            }

            if state == .unlocking {
                Circle()
                    .stroke(.white.opacity(0.72), lineWidth: 2)
                    .frame(width: 124, height: 124)
                    .scaleEffect(keyPhase == .turning ? 1.28 : 0.78)
                    .opacity(keyPhase == .turning ? 0 : 0.55)
                    .animation(.easeOut(duration: 0.7), value: keyPhase)
            }

            if state == .unlocked {
                Image(systemName: "checkmark.circle.fill")
                    .font(.system(size: 30))
                    .foregroundStyle(.white)
                    .offset(x: 48, y: -48)
                    .transition(.scale.combined(with: .opacity))
            }
        }
        .frame(width: 150, height: 150)
        .task(id: state) {
            await runAnimation(for: state)
        }
    }

    private var keyOffset: CGFloat {
        switch keyPhase {
        case .hidden: 88
        case .entering: 54
        case .inserted: 8
        case .turning: 8
        case .finished: 8
        }
    }

    private var keyRotation: Double {
        switch keyPhase {
        case .hidden, .entering, .inserted: -90
        case .turning: -62
        case .finished: -48
        }
    }

    private var keyOpacity: Double {
        switch keyPhase {
        case .hidden: 0
        case .entering: 0.58
        case .inserted, .turning: 1
        case .finished: 0
        }
    }

    @MainActor
    private func runAnimation(for visualState: LockVisualState) async {
        switch visualState {
        case .locked:
            keyPhase = .hidden
        case .unlocked:
            withAnimation(.easeOut(duration: 0.22)) { keyPhase = .finished }
        case .unlocking:
            keyPhase = .hidden
            guard await pause(milliseconds: 90) else { return }
            withAnimation(.easeOut(duration: 0.36)) { keyPhase = .entering }
            guard await pause(milliseconds: 300) else { return }
            withAnimation(.spring(response: 0.52, dampingFraction: 0.78)) { keyPhase = .inserted }
            guard await pause(milliseconds: 360) else { return }
            withAnimation(.easeInOut(duration: 0.68)) { keyPhase = .turning }
        }
    }

    private func pause(milliseconds: UInt64) async -> Bool {
        do {
            try await Task.sleep(for: .milliseconds(milliseconds))
            return !Task.isCancelled
        } catch {
            return false
        }
    }
}

private struct StatusPill: View {
    let title: String; var icon: String? = nil; let color: Color
    var body: some View { Label(title, systemImage: icon ?? "circle.fill").font(.caption.weight(.semibold)).foregroundStyle(color).padding(.horizontal, 10).padding(.vertical, 7).background(color.opacity(0.12), in: Capsule()) }
}

private struct ParameterMetric: View {
    let title: String; let value: String
    var body: some View { VStack(spacing: 4) { Text(title).font(.caption2).foregroundStyle(.secondary); Text(value).font(.caption.weight(.semibold)).lineLimit(1).minimumScaleFactor(0.7) }.frame(maxWidth: .infinity) }
}

struct SettingsView: View {
    @Bindable var store: AppStore
    @Bindable var bluetooth: BluetoothManager
    @State private var showingAdd = false
    @State private var rebinding: DeviceProfile?
    @State private var showingImport = false
    @State private var alert: String?

    var body: some View {
        NavigationStack {
            Form {
                if let profile = store.activeDevice {
                    Section {
                        NavigationLink {
                            DeviceDetailView(profileID: profile.id, store: store, bluetooth: bluetooth)
                        } label: {
                            CurrentDeviceCard(profile: profile, state: bluetooth.state)
                        }
                        .buttonStyle(.plain)
                    }
                    Section {
                        NavigationLink("设备管理") {
                            DeviceManagementView(store: store, bluetooth: bluetooth, showingAdd: $showingAdd, rebinding: $rebinding)
                        }
                        NavigationLink("自动化设置") {
                            AutomationSettingsView(store: store, profile: profile, onCopy: copyURL)
                        }
                        NavigationLink("数据迁移") {
                            MigrationSettingsView(showingImport: $showingImport, sharePayload: sharePayload() ?? "")
                        }
                        NavigationLink("安全与隐私") {
                            SecuritySettingsView(store: store)
                        }
                    }
                    Section("关于") {
                        Text("EasyOpen").foregroundStyle(.secondary)
                        Text("本地蓝牙开门工具").font(.caption).foregroundStyle(.secondary)
                    }
                } else {
                    ContentUnavailableView("尚未添加开锁器", systemImage: "lock.slash", description: Text("请先添加设备。"))
                }
            }
            .navigationTitle("设定")
            .sheet(isPresented: $showingAdd) { AddOpenerView(store: store, bluetooth: bluetooth) }
            .sheet(item: $rebinding) { profile in RebindDeviceView(profile: profile, store: store, bluetooth: bluetooth) }
            .sheet(isPresented: $showingImport) { ImportView(store: store) }
            .alert("提示", isPresented: Binding(get: { alert != nil }, set: { if !$0 { alert = nil } })) {
                Button("好", role: .cancel) {}
            } message: { Text(alert ?? "") }
        }
    }

    private func sharePayload() -> String? {
        let passwords = Dictionary(uniqueKeysWithValues: store.devices.compactMap { profile in
            store.password(for: profile).map { (profile.id, $0) }
        })
        return try? TransferCodec.encodeShare(store.devices, passwords: passwords)
    }

    private func copyURL(_ url: String) {
        UIPasteboard.general.string = url
        alert = "已复制快捷指令 URL"
    }
}

private struct CurrentDeviceCard: View {
    let profile: DeviceProfile
    let state: ConnectionState

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Label("当前设备", systemImage: "lock.fill")
                .font(.subheadline.weight(.semibold))
                .foregroundStyle(.secondary)
            Text(profile.name)
                .font(.title3.bold())
                .foregroundStyle(.primary)
            HStack(spacing: 8) {
                Label(state.label, systemImage: state == .ready || state == .success ? "checkmark.circle.fill" : "circle.fill")
                if let battery = profile.batteryLevel {
                    Text("· \(battery.batteryLabel)")
                }
            }
            .font(.subheadline.weight(.medium))
            .foregroundStyle(state == .ready || state == .success ? .green : .secondary)
            Text(profile.peripheralIdentifier == nil ? "未绑定蓝牙设备" : "已绑定蓝牙设备")
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .padding(.vertical, 8)
    }
}

private struct DeviceManagementView: View {
    @Bindable var store: AppStore
    @Bindable var bluetooth: BluetoothManager
    @Binding var showingAdd: Bool
    @Binding var rebinding: DeviceProfile?

    var body: some View {
        List {
            Section("开锁器") {
                ForEach(store.devices) { profile in
                    Button {
                        store.activeDeviceID = profile.id
                    } label: {
                        HStack {
                            VStack(alignment: .leading, spacing: 4) {
                                Text(profile.name)
                                Text(profile.peripheralIdentifier == nil ? "未绑定蓝牙设备" : "已绑定蓝牙设备")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                            Spacer()
                            if profile.id == store.activeDeviceID { Image(systemName: "checkmark") }
                        }
                    }
                    .foregroundStyle(.primary)
                }
                .onDelete { offsets in offsets.map { store.devices[$0] }.forEach(store.remove) }
                Button { showingAdd = true } label: { Label("添加开锁器", systemImage: "plus") }
            }
        }
        .navigationTitle("设备管理")
    }
}

struct RebindDeviceView: View {
    @Environment(\.dismiss) private var dismiss
    let profile: DeviceProfile
    @Bindable var store: AppStore
    @Bindable var bluetooth: BluetoothManager

    var body: some View {
        NavigationStack {
            List {
                Section {
                    Text("选择与“\(profile.name)”对应的 YILA 开锁器。Android MAC 仅用于识别，iOS 会保存系统蓝牙标识。")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
                Section("附近设备") {
                    Button("重新扫描") { bluetooth.scan() }
                    ForEach(bluetooth.discovered, id: \.identifier) { peripheral in
                        Button { bind(peripheral) } label: {
                            VStack(alignment: .leading) {
                                Text(bluetooth.names[peripheral.identifier] ?? peripheral.name ?? "未命名 YILA")
                                Text("RSSI \(bluetooth.rssis[peripheral.identifier]?.stringValue ?? "未知") · \(peripheral.identifier.uuidString)")
                                    .font(.caption2)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                    if bluetooth.discovered.isEmpty {
                        Text("点击“重新扫描”查找设备").foregroundStyle(.secondary)
                    }
                }
            }
            .navigationTitle("重新绑定")
            .toolbar { ToolbarItem(placement: .cancellationAction) { Button("取消") { dismiss() } } }
            .onAppear { bluetooth.scan() }
        }
    }

    private func bind(_ peripheral: CBPeripheral) {
        store.bind(profile, to: peripheral.identifier)
        dismiss()
    }
}

private struct DeviceDetailView: View {
    let profileID: UUID
    @Bindable var store: AppStore
    @Bindable var bluetooth: BluetoothManager
    @State private var editing: EditItem?
    @State private var rebinding = false

    private var profile: DeviceProfile { store.devices.first(where: { $0.id == profileID }) ?? store.activeDevice! }

    enum EditItem: String, Identifiable {
        case name, open, wait, close
        var id: String { rawValue }
    }

    var body: some View {
        Form {
            Section("设备信息") {
                Button { editing = .name } label: { LabeledContent("设备名称", value: profile.name) }
                LabeledContent("蓝牙状态", value: profile.peripheralIdentifier == nil ? "未绑定" : bluetooth.state.label)
                if let battery = profile.batteryLevel { LabeledContent("设备电量", value: battery.batteryLabel) }
                Button("重新绑定蓝牙设备") { rebinding = true }
            }
            Section("开锁参数") {
                Button {
                    toggleDirection()
                } label: {
                    LabeledContent("方向", value: profile.attribute == 0 ? "正向 +" : "反向 −")
                }
                Button { editing = .open } label: { LabeledContent("开启", value: "\(profile.openTimeMs) ms") }
                Button { editing = .wait } label: { LabeledContent("保持", value: "\(profile.waitTimeMs) ms") }
                Button { editing = .close } label: { LabeledContent("关闭", value: "\(profile.closeTimeMs) ms") }
            }
        }
        .navigationTitle("当前设备")
        .sheet(item: $editing) { item in
            EditDeviceItemSheet(item: item, profile: profile, store: store)
                .presentationDetents([.height(item == .name ? 220 : 300)])
        }
        .sheet(isPresented: $rebinding) { RebindDeviceView(profile: profile, store: store, bluetooth: bluetooth) }
    }

    private func toggleDirection() {
        var updated = profile
        updated.attribute = updated.attribute == 0 ? 1 : 0
        try? store.update(updated)
        UISelectionFeedbackGenerator().selectionChanged()
    }
}

private struct EditDeviceItemSheet: View {
    let item: DeviceDetailView.EditItem
    let profile: DeviceProfile
    @Bindable var store: AppStore
    @Environment(\.dismiss) private var dismiss
    @State private var text: String
    @State private var value: Double

    private var maxDuration: Double {
        switch item {
        case .wait: return 10000
        case .open, .close: return 5000
        default: return 5000
        }
    }

    init(item: DeviceDetailView.EditItem, profile: DeviceProfile, store: AppStore) {
        self.item = item; self.profile = profile; self.store = store
        _text = State(initialValue: profile.name)
        let initial: Int
        switch item {
        case .open: initial = min(5000, max(100, profile.openTimeMs))
        case .wait: initial = min(10000, max(100, profile.waitTimeMs))
        case .close: initial = min(5000, max(100, profile.closeTimeMs))
        default: initial = 0
        }
        _value = State(initialValue: Double(initial))
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                if item == .name {
                    TextField("设备名称", text: $text)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal)
                } else {
                    Text("\(Int(value)) ms").font(.title2.bold())
                    Slider(value: $value, in: 100...maxDuration, step: 50).padding(.horizontal)
                    HStack {
                        Button("−") { value = max(100, value - 50) }
                        Spacer()
                        Button("+") { value = min(maxDuration, value + 50) }
                    }
                    .font(.title2.bold())
                    .padding(.horizontal, 40)
                }
                Spacer()
            }
            .padding(.top, 24)
            .navigationTitle(title)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) { Button("取消") { dismiss() } }
                ToolbarItem(placement: .confirmationAction) { Button("完成") { save(); dismiss() } }
            }
        }
    }

    private var title: String {
        switch item { case .name: "修改设备名称"; case .open: "开启时长"; case .wait: "保持时长"; case .close: "关闭时长" }
    }

    private func save() {
        var updated = profile
        switch item {
        case .name: updated.name = text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ? profile.name : text
        case .open: updated.openTimeMs = Int(value)
        case .wait: updated.waitTimeMs = Int(value)
        case .close: updated.closeTimeMs = Int(value)
        }
        try? store.update(updated)
    }
}

private struct AutomationSettingsView: View {
    @Bindable var store: AppStore
    let profile: DeviceProfile
    let onCopy: (String) -> Void

    var body: some View {
        Form {
            Section("NFC 自动开锁") {
                Toggle("允许 NFC 自动开锁", isOn: $store.nfcAutoUnlock)
                Toggle("App 启动时自动开锁", isOn: $store.autoUnlockOnAppOpen)
            }
            Section("连接") {
                Toggle("自动连接当前设备", isOn: $store.autoConnectEnabled)
                Stepper("RSSI 阈值 \(store.customAutoConnectRssi) dBm", value: $store.customAutoConnectRssi, in: -100...0, step: 5)
            }
            Section("快捷指令 URL") {
                Text("easyopen://unlock?device=\(profile.id.uuidString)")
                    .font(.footnote)
                    .textSelection(.enabled)
                Button { onCopy("easyopen://unlock?device=\(profile.id.uuidString)") } label: {
                    Label("点击复制 URL", systemImage: "doc.on.doc")
                }
            }
        }
        .navigationTitle("自动化设置")
    }
}

private struct MigrationSettingsView: View {
    @Binding var showingImport: Bool
    let sharePayload: String

    var body: some View {
        List {
            Section {
                Button { showingImport = true } label: { Label("扫描导入", systemImage: "qrcode.viewfinder") }
                NavigationLink { QRCodeView(payload: sharePayload).navigationTitle("设备配置二维码") } label: {
                    Label("展示二维码导出", systemImage: "qrcode")
                }
            } footer: {
                Text("二维码包含全部设备配置，请仅通过可信渠道传输。")
            }
        }
        .navigationTitle("数据迁移")
    }
}

private struct SecuritySettingsView: View {
    @Bindable var store: AppStore
    var body: some View {
        Form {
            Section("密码") {
                Toggle("在 Keychain 保存密码", isOn: $store.savePasswords)
            }
            Section {
                Text("密码只保存在本机 Keychain，不会显示在设置页面。")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
        }
        .navigationTitle("安全与隐私")
    }
}

struct BackupDocument: FileDocument {
    static var readableContentTypes: [UTType] { [.json] }
    var data: Data
    init(data: Data = Data()) { self.data = data }
    init(configuration: ReadConfiguration) throws { data = configuration.file.regularFileContents ?? Data() }
    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper { FileWrapper(regularFileWithContents: data) }
}

extension ConnectionState { var label: String { switch self { case .unavailable: "蓝牙不可用"; case .scanning: "正在扫描"; case .discovered: "已发现设备"; case .connecting: "正在连接"; case .ready: "设备已就绪"; case .unlocking: "正在开锁"; case .success: "开锁成功"; case .disconnected: "未连接"; case .failure(let value): value } } }

extension Int {
    var batteryLabel: String {
        switch self {
        case 1: "电量低"
        case 2: "电量约 25%"
        case 3: "电量约 50%"
        case 4: "电量约 75%"
        case 5: "电量约 100%"
        default: "电量未知"
        }
    }
}
