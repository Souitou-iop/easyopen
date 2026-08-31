import SwiftUI
import AVFoundation

struct QRScannerView: UIViewControllerRepresentable {
    var onCode: (String) -> Void
    func makeUIViewController(context: Context) -> ScannerController { let c = ScannerController(); c.onCode = onCode; return c }
    func updateUIViewController(_ uiViewController: ScannerController, context: Context) {}
    final class ScannerController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
        var onCode: ((String) -> Void)?; private let session = AVCaptureSession()
        override func viewDidLoad() { super.viewDidLoad(); guard let input = try? AVCaptureDeviceInput(device: AVCaptureDevice.default(for: .video)!), session.canAddInput(input) else { return }; session.addInput(input); let output = AVCaptureMetadataOutput(); guard session.canAddOutput(output) else { return }; session.addOutput(output); output.setMetadataObjectsDelegate(self, queue: .main); output.metadataObjectTypes = [.qr]; let preview = AVCaptureVideoPreviewLayer(session: session); preview.videoGravity = .resizeAspectFill; preview.frame = view.bounds; view.layer.addSublayer(preview); session.startRunning() }
        func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) { guard let value = (metadataObjects.first as? AVMetadataMachineReadableCodeObject)?.stringValue else { return }; session.stopRunning(); onCode?(value) }
    }
}
