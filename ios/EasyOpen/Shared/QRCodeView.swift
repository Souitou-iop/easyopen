import SwiftUI
import CoreImage.CIFilterBuiltins

struct QRCodeView: View {
    let payload: String
    private let context = CIContext()
    var body: some View { Group { if let image = makeImage() { Image(uiImage: image).interpolation(.none).resizable().scaledToFit() } else { ContentUnavailableView("二维码生成失败", systemImage: "qrcode") } }.padding(24).background(.white, in: RoundedRectangle(cornerRadius: 18)) }
    private func makeImage() -> UIImage? { let filter = CIFilter.qrCodeGenerator(); filter.message = Data(payload.utf8); filter.correctionLevel = "M"; guard let output = filter.outputImage, let cg = context.createCGImage(output.transformed(by: CGAffineTransform(scaleX: 12, y: 12)), from: output.extent.applying(CGAffineTransform(scaleX: 12, y: 12))) else { return nil }; return UIImage(cgImage: cg) }
}
