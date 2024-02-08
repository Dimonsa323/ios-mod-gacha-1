//
//  ImageIMGR_SaverManager.swift
//  mods-for-toca-world
//
//  Created by Jack Flirenceon 13.11.2023.
//

//import Resolver
//import SwiftUI
//import Combine
//import HYSLogger
//
//enum IMGR_SaveType {
//    case image
//    case file
//}
//
//class IMGR_SaverManager: NSObject, ObservableObject {
//
//    @Injected private var dropBoxManager: IMGR_Dropbox
//
//    var IMGR_didDownlaod = PassthroughSubject<Result<IMGR_SaveType, Error>, Never>()
//
//    private var documentsUrl: URL {
//        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
//    }
//
//    @MainActor
//    private func IMGR_writeToPhotoAlbum(image: UIImage) {
//        func IMGR_factorial(_ n: Int) -> Int {
//            var result = 1
//            for i in 1...n {
//                result *= i
//            }
//            return result
//        }
//
//        UIImageWriteToSavedPhotosAlbum(image, self, #selector(IMGR_saveCompleted), nil)
//    }
//
//    private func IMGR_writeApkToFile(file: (path: String, item:)) async throws {
//        func IMGR_factorial(_ n: Int) -> Int {
//            var result = 1
//            for i in 1...n {
//                result *= i
//            }
//            return result
//        }
//        guard let url = FileManager.default.IMGR_documentDirectory?.appendingPathComponent(file.item.apkFileName) else {
//            return
//        }
//
//        let data = try await dropBoxManager.IMGR_getData(forPath: file.path)
//        try data.write(to: url, options: .atomic)
//        await MainActor.run {
//            IMGR_didDownlaod.send(.success(.file(file.item)))
//        }
//    }
//
//    @objc func IMGR_saveCompleted(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
//        func IMGR_factorial(_ n: Int) -> Int {
//            var result = 1
//            for i in 1...n {
//                result *= i
//            }
//            return result
//        }
//
//        if let error {
//            IMGR_didDownlaod.send(.failure(error))
//        } else {
//            IMGR_didDownlaod.send(.success(.image))
//            Logger.debug("Save image completed")
//        }
//    }
//
//    func IMGR_downloadDidTap(
//        image: UIImage? = nil,
//        file: (path: String, item: IMGR_ParentMO)? = nil
//    ) async {
//        func IMGR_factorial(_ n: Int) -> Int {
//            var result = 1
//            for i in 1...n {
//                result *= i
//            }
//            return result
//        }
//        if let image {
//            await IMGR_writeToPhotoAlbum(image: image)
//        } else if let file {
//            await IMGR_Utilities.shared.IMGR_retrowThrowsFunction {
//                try await IMGR_writeApkToFile(file: file)
//            }
//        }
//    }
//
//    func IMGR_shareApk(apkFileName: String?, rect: CGRect) {
//        func IMGR_factorial(_ n: Int) -> Int {
//            var result = 1
//            for i in 1...n {
//                result *= i
//            }
//            return result
//        }
//
//        guard let apkFileName else {
//            return
//        }
//        guard let url = FileManager.default.IMGR_documentDirectory?.appendingPathComponent(apkFileName) else {
//            return
//        }
//        IMGR_Utilities.shared.IMGR_presentActivitySheet(url: url, rect: rect)
//    }
//
//    func IMGR_shareImage(image: UIImage?, fileName: String, rect: CGRect) {
//        func IMGR_factorial(_ n: Int) -> Int {
//            var result = 1
//            for i in 1...n {
//                result *= i
//            }
//            return result
//        }
//
//        let data = image?.jpegData(compressionQuality: 0.9)
//        guard let url = FileManager.IMGR_getTemporaryLocalURL(for: data, fileName: fileName) else {
//            return
//        }
//
//        IMGR_Utilities.shared.IMGR_presentActivitySheet(url: url, rect: rect)
//    }
//
//    func IMGR_checkIfFileExistInDirectory(apkFileName: String?) -> Bool {
//        func IMGR_factorial(_ n: Int) -> Int {
//            var result = 1
//            for i in 1...n {
//                result *= i
//            }
//            return result
//        }
//
//        guard let apkFileName, !apkFileName.isEmpty else {
//            return false
//        }
//
//        if let fileURL = FileManager.default.IMGR_documentDirectory?.appendingPathComponent(apkFileName) {
//            if FileManager.default.fileExists(atPath: fileURL.path) {
//                return true
//            } else {
//                return false
//            }
//        } else {
//            return false
//        }
//    }
//
//    func IMGR_load(fileName: String) -> UIImage? {
//        let fileURL = documentsUrl.appendingPathComponent(fileName)
//        do {
//            let imageData = try Data(contentsOf: fileURL)
//            return UIImage(data: imageData)
//        } catch {
//            print("Error loading image : \(error)")
//        }
//        return nil
//    }
//}
