import SwiftUI
import AVFoundation

struct OCRScannerView: View {
    @State private var isCameraPresented: Bool = false

    var body: some View {
        VStack {
            Button(action: {
                isCameraPresented = true
            }) {
                Text("Open Camera for OCR")
                    .font(.headline)
                    .padding()
                    .frame(width: 200, height: 50)
                    .background(AppColors.primaryRed)
                    .foregroundColor(.white)
                    .cornerRadius(25)
            }
            .fullScreenCover(isPresented: $isCameraPresented) {
                CameraView()
            }
        }
        .padding()
        .background(AppColors.backgroundWhite)
    }
}

struct CameraView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        var parent: CameraView

        init(_ parent: CameraView) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            // Handle the scanned image here
            picker.dismiss(animated: true)
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true)
        }
    }
}

struct OCRScannerView_Previews: PreviewProvider {
    static var previews: some View {
        OCRScannerView()
    }
}
