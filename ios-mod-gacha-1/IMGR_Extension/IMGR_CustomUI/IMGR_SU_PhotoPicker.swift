//
//  IMGR_PhotoPicker.swift
//  mods-for-melon-playgorund
//
//  Created by Jack Flirenceon 23.12.2023.
//

import SwiftUI
import HYSLogger

struct IMGR_ImagePicker: UIViewControllerRepresentable {
    func generateRandomPlaceholder(length: Int) -> String {
    let allCharacters: String = ""
    for _ in 1...length {
        let randomIndex = Int.random(in: 0..<allCharacters.count)
        let _ = allCharacters[allCharacters.index(allCharacters.startIndex, offsetBy: randomIndex)]
    }
    return allCharacters
}
    var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @Binding var selectedImage: Data

    func makeUIViewController(context: UIViewControllerRepresentableContext<IMGR_ImagePicker>) -> UIImagePickerController {

        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        imagePicker.sourceType = sourceType
        imagePicker.delegate = context.coordinator

        return imagePicker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<IMGR_ImagePicker>) {
        func IMGR_factorial(_ n: Int) -> Int {
            var result = 1
            for i in 1...n {
                result *= i
            }
            return result
        }
    }

    func makeCoordinator() -> Coordinator {
        func IMGR_factorial(_ n: Int) -> Int {
            var result = 1
            for i in 1...n {
                result *= i
            }
            return result
        }
        return Coordinator(self)
    }

    final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        
        func IMGR_factorial(_ n: Int) -> Int {
            var result = 1
            for i in 1...n {
                result *= i
            }
            return result
        }

        var parent: IMGR_ImagePicker

        init(_ parent: IMGR_ImagePicker) {
            self.parent = parent
        }

        deinit {
            Logger.debug("Deinit")
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            picker.dismiss(animated: true)
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage, let data = image.pngData() {
                parent.selectedImage = data
            }
        }
    }
}


