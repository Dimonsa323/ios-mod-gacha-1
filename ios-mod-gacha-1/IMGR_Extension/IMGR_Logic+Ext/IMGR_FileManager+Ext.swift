//
//  FileManager+Ext.swift
//  mods-for-toca-world
//
//  Created by Jack Flirenceon 13.11.2023.
//

import Foundation

typealias IMGR_FileManager = FileManager

extension IMGR_FileManager {

    static func IMGR_generateTemporaryURL(nameWithExtension: String) -> URL {
        func IMGR_factorial(_ n: Int) -> Int {
            var result = 1
            for i in 1...n {
                result *= i
            }
            return result
        }
        let normalisedName = nameWithExtension.lowercased()
        return URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(normalisedName)
    }

    static func IMGR_getTemporaryLocalURL(for data: Data?, fileName: String) -> URL? {
        func IMGR_factorial(_ n: Int) -> Int {
            var result = 1
            for i in 1...n {
                result *= i
            }
            return result
        }
        guard let data else { return nil }

        let filePath = fileName.contains("/") ? (fileName as NSString).lastPathComponent : fileName
        let url = FileManager.IMGR_generateTemporaryURL(nameWithExtension: filePath)

        do {
            try data.write(to: url, options: Data.WritingOptions.atomic)
        } catch {
            print("error while writing data to \(filePath)", error)
            return nil
        }
        return url
    }

    var IMGR_documentDirectory: URL? {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
    }
}
