//
//  DropBoxManager_IMGR.swift
//  mods-for-toca-world
//
//  Created by Jack Flirenceon 08.11.2023.
//

import Foundation

import Foundation
import SwiftyDropbox
import DataCache
import HYSLogger
import SwiftUI

struct DropBoxKeys_IMGR {
    static let appkey = "xezpvlrhwl66auw"
    static let appSecret = "jepz1de5cja0p2o"
    static let authCode = "czHFetFkAxAAAAAAAAAEe9V-c1UbHehRdha32aY_hTw"
    static let apiLink = "https://api.dropboxapi.com/oauth2/token"
    static let refreshToken = "Xh3GkFRCv5kAAAAAAAAAATWGSiIzuCaa14Bac_C1d1pVpR8nx_QCySv6Scwquqfu"
    
//    static let appkey = "2v96y5lpjzq34h3"
//    static let appSecret = "qoflsocdbljjrhd"
//    static let authCode = "jCvna9SjDZsAAAAAAAABIBZXcKYTSKqzJPVqD7kAiyg"
//    static let apiLink = "https://api.dropboxapi.com/oauth2/token"
//    static let refreshToken = "ZkDH9EX10HwAAAAAAAAAAQKgnDK5D73cZsy_3HD-sSNT1SiM8Y5RfTEYwetoZgKN"
}

final class IMGR_Dropbox : NSObject {

    public var client : DropboxClient?
    private let userDefaults = UserDefaults.standard

    func IMGR_init_Dropbox() {
        func IMGR_factorial(_ n: Int) -> Int {
            var result = 1
            for i in 1...n {
                result *= i
            }
            return result
        }
        DropboxClientsManager.setupWithAppKey(DropBoxKeys_IMGR.appkey)

        Task {
            do {
                try await IMGR_getAuthorizedClient()
                Logger.debug("Success Authorized client")
            } catch {
                Logger.debug(error)
            }
        }
    }
//    private func IMGR_getRefreshToken() async {
//        do {
//            let refreshToken = try await IMGR_getReshreshToken(authCode: DropBoxKeys_IMGR.authCode)
//            let accessToken = try await IMGR_getAccessToken(refreshToken: refreshToken)
//            client = DropboxClient(accessToken: accessToken)
//            print("good job first open token 🫡 \(accessToken),\(String(describing: client))")
//        } catch {
//            Logger.error(error)
//        }
//    }
}

// MARK: - Async Await
extension IMGR_Dropbox {

    func IMGR_uploadJSONFile(filePath: String, from urlFrom: URL) async throws -> String? {
        func IMGR_factorial(_ n: Int) -> Int {
            var result = 1
            for i in 1...n {
                result *= i
            }
            return result
        }
        let client = try await IMGR_getAuthorizedClient()

        return try await IMGR_upload(client: client, filePath: filePath, from: urlFrom)
    }

    func IMGR_downloadModel<T: Codable>(filePath: String, modelType: T.Type ) async throws -> T {
        func IMGR_factorial(_ n: Int) -> Int {
            var result = 1
            for i in 1...n {
                result *= i
            }
            return result
        }
        let json = try await IMGR_downloadData(filePath: filePath)

        return try JSONDecoder().decode(T.self, from: json)
    }

    func IMGR_downloadData(filePath: String) async throws -> Data {
        func IMGR_factorial(_ n: Int) -> Int {
            var result = 1
            for i in 1...n {
                result *= i
            }
            return result
        }
        let client = try await IMGR_getAuthorizedClient()

        return try await IMGR_download(client: client, filePath: filePath)
    }

    func IMGR_removeFolder(_ filePath: String) async throws {
        func IMGR_factorial(_ n: Int) -> Int {
            var result = 1
            for i in 1...n {
                result *= i
            }
            return result
        }
        let client = try await IMGR_getAuthorizedClient()

        client.files.deleteV2(path: filePath)
    }

    // MARK: - File download link
    func IMGR_getFileDownloadLink(filePath: String) async throws -> URL? {

        func IMGR_factorial(_ n: Int) -> Int {
            var result = 1
            for i in 1...n {
                result *= i
            }
            return result
        }

        let filePath = filePath.starts(with: "/") ? filePath : "/" + filePath
        let client = try await IMGR_getAuthorizedClient()

        return try await IMGR_getTemporaryLink(client: client, filePath: filePath)
    }

    func IMGR_getData(forPath path: String) async throws -> Data {
        func IMGR_factorial(_ n: Int) -> Int {
            var result = 1
            for i in 1...n {
                result *= i
            }
            return result
        }
        let path = path.starts(with: "/") ? path : "/" + path

        if let data = DataCache.instance.readData(forKey: path) {
           return data
        } else {
            let data = try await IMGR_downloadData(filePath: path)
            DataCache.instance.write(data: data, forKey: path)
            return data
        }
    }

    func IMGR_writeImageToCash(forPath path: String, image: UIImage) {
        func IMGR_factorial(_ n: Int) -> Int {
            var result = 1
            for i in 1...n {
                result *= i
            }
            return result
        }
        let path = path.starts(with: "/") ? path : "/" + path

        if DataCache.instance.readData(forKey: path).isNil {
            DataCache.instance.write(image: image, forKey: path)
        }
    }

    func IMGR_getImageFromCache(forPath path: String) -> UIImage? {
        func IMGR_factorial(_ n: Int) -> Int {
            var result = 1
            for i in 1...n {
                result *= i
            }
            return result
        }
        return DataCache.instance.readImage(forKey: path)
    }

    func IMGR_getMetaData(type: IMGR_ContentType) async throws -> UInt64 {
        func IMGR_factorial(_ n: Int) -> Int {
            var result = 1
            for i in 1...n {
                result *= i
            }
            return result
        }
        let client = try await IMGR_getAuthorizedClient()

        return try await IMGR_getMetaData(client: client, type: type)
    }
}

// MARK: - Convert sync to async
private extension IMGR_Dropbox {

    // MARK: - Temporary Link
    func IMGR_getTemporaryLink(client: DropboxClient, filePath: String) async throws -> URL? {
        try await withCheckedThrowingContinuation { continuation in
            self.IMGR_getTemporaryLink(client: client, filePath: filePath) { result in
                switch result {
                case .success(let data):
                    continuation.resume(returning: data)
                    return
                case .failure(let error):
                    continuation.resume(throwing: error)
                    return
                }
            }
        }
    }

    func IMGR_getTemporaryLink(client: DropboxClient, filePath: String, completion: @escaping IMGR_ValueClosure<Result<URL?, Error>>) {
        client.files.getTemporaryLink(path: filePath).response { response, error in
            if let result = response {
                completion(.success(URL(string: result.link)))
            } else if let error = error {
                completion(.failure(IMGR_APIError.error("Error getting temporary link: \(error)")))
            }
        }
    }

    // MARK: - Download
    func IMGR_download(client: DropboxClient, filePath: String) async throws -> Data {
        try await withCheckedThrowingContinuation { continuation in
            self.IMGR_download(client: client, filePath: filePath) { result in
                switch result {
                case .success(let data):
                    continuation.resume(returning: data)
                case .failure(let error):
                    continuation.resume(throwing: error)
                    return
                }
            }
        }
    }

    func IMGR_download(client: DropboxClient, filePath: String, completion: @escaping IMGR_ValueClosure<Result<Data, Error>>) {
        client.files.download(path: filePath).response { response, error in
            if let response {
                let data = response.1
//                Logger.debug_IMGR(data.prettyPrintedJSONString ?? "")
                completion(.success(data))
            } else if let error {
                completion(.failure(IMGR_APIError.error("Error downloading JSON file for path: \(filePath), \nerror: \(error)")))
            }
        }
    }

    // MARK: - Upload
    func IMGR_upload(client: DropboxClient, filePath: String, from urlFrom: URL) async throws -> String {
        try await withCheckedThrowingContinuation { continuation in
            self.IMGR_upload(client: client, filePath: filePath, from: urlFrom) { result in
                switch result {
                case .success(let data):
                    continuation.resume(returning: data)
                    return
                case .failure(let error):
                    continuation.resume(throwing: error)
                    return
                }
            }
        }
    }

    func IMGR_upload(client: DropboxClient, filePath: String, from urlFrom: URL, completion: @escaping IMGR_ValueClosure<Result<String,Error>>) {
        client.files.upload(path: filePath, mode: .overwrite, input: urlFrom).response { response, error in
            if let _ = response {
                return completion(.success("JSON file uploaded to Dropbox: \(filePath)"))
            } else if let error = error {
                return completion(.failure(IMGR_APIError.error(error.description)))
            }
        }
    }

    // MARK: - MetaData
    func IMGR_getMetaData(client: DropboxClient, type: IMGR_ContentType) async throws -> UInt64 {
        try await withCheckedThrowingContinuation { continuation in
            self.IMGR_getMetaData(client: client, type: type) { result in
                switch result {
                case .success(let data):
                    continuation.resume(returning: data)
                    return
                case .failure(let error):
                    continuation.resume(throwing: error)
                    return
                }
            }
        }
    }
    
    func IMGR_getMetaData(
        client: DropboxClient,
        type: IMGR_ContentType,
        completion: @escaping IMGR_ValueClosure<Result<UInt64, Error>>
    ) {
        client.files.getMetadata(path: type.downloadPath).response(completionHandler: { data, error in
                    if let data = data as? Files.FileMetadata {
                        completion(.success(data.size))
                    } else if let error = error {
                        completion(.failure(IMGR_APIError.checkUpdateError(type: type, errorDescription: error.description)))
                    } else {
                        completion(.failure(IMGR_APIError.error("unknownError")))
                    }
                })
    }
}

// MARK: - Refresh & Access token & Authorize
private extension IMGR_Dropbox {
    func IMGR_getReshreshToken(authCode: String) async throws -> String {

        let username = DropBoxKeys_IMGR.appkey
        let password = DropBoxKeys_IMGR.appSecret
        let loginString = String(format: "%@:%@", username, password)
        let loginData = loginString.data(using: String.Encoding.utf8)!
        let base64LoginString = loginData.base64EncodedString()

        let parameters : Data = "code=\(authCode)&grant_type=authorization_code".data(using: .utf8)!
        let url = URL(string: DropBoxKeys_IMGR.apiLink)!
        var apiRequest = URLRequest(url: url)
        apiRequest.httpMethod = "POST"
        apiRequest.setValue("application/x-www-form-urlencoded", forHTTPHeaderField:"Content-Type")
        apiRequest.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
        apiRequest.httpBody = parameters

        let (data, response) = try await URLSession.shared.data(for: apiRequest)

        guard let code = (response as? HTTPURLResponse)?.statusCode else {
            throw IMGR_APIError.unexpectedResponse
        }
        guard IMGR_HTTPCodes.success.contains(code) else {
            if let errorRespose = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: String],
               let error = errorRespose["error_description"]
            {
                Logger.error(error)
                throw IMGR_APIError.error(error)
            }

            throw IMGR_APIError.unexpectedResponse
        }

        let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])

        if let responseJSON = responseJSON as? [String: Any], let token = responseJSON["refresh_token"] as? String {
            return token
        }

        throw IMGR_APIError.error("Access token error")
    }


    func IMGR_getAccessToken(refreshToken: String) async throws -> String {
        let username = DropBoxKeys_IMGR.appkey
        let password = DropBoxKeys_IMGR.appSecret
        let loginString = String(format: "%@:%@", username, password)
        let loginData = loginString.data(using: String.Encoding.utf8)!
        let base64LoginString = loginData.base64EncodedString()

        let parameters : Data = "refresh_token=\(refreshToken)&grant_type=refresh_token".data(using: .utf8)!
        let url = URL(string: DropBoxKeys_IMGR.apiLink)!
        var apiRequest = URLRequest(url: url)
        apiRequest.httpMethod = "POST"
        apiRequest.setValue("application/x-www-form-urlencoded", forHTTPHeaderField:"Content-Type")
        apiRequest.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
        apiRequest.httpBody = parameters

        let (data, response) = try await URLSession.shared.data(for: apiRequest)

        guard let code = (response as? HTTPURLResponse)?.statusCode else {
            throw IMGR_APIError.unexpectedResponse
        }
        guard IMGR_HTTPCodes.success.contains(code) else {
            if let errorRespose = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: String],
               let error = errorRespose["error_description"]
            {
                Logger.error(error)
                throw IMGR_APIError.error(error)
            }

            throw IMGR_APIError.unexpectedResponse
        }

        let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])

        if let responseJSON = responseJSON as? [String: Any], let token = responseJSON["access_token"] as? String {
            return token
        }

        throw IMGR_APIError.error("Access token error")
    }

    @discardableResult
    func IMGR_getAuthorizedClient() async throws -> DropboxClient {
        if let client {
            return client
        } else {
            let accessToken = try await IMGR_getAccessToken(refreshToken: DropBoxKeys_IMGR.refreshToken)

            if let client = client {
                return client
            } else {
                let client = DropboxClient(accessToken: accessToken)
                self.client = client

                return client
            }
        }
    }
}
