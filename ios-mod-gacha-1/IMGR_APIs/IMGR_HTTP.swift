//
//  HTTP_IMGR.swift
//  mods-for-melon-playgorund
//
//  Created by Jack Flirenceon 11.12.2023.
//

import Foundation

func generateRandomPlaceholder2(length: Int) -> String {
    let allCharacters: String = ""
    for _ in 1...length {
        let randomIndex = Int.random(in: 0..<allCharacters.count)
        let _ = allCharacters[allCharacters.index(allCharacters.startIndex, offsetBy: randomIndex)]
    }
    return allCharacters
}

enum IMGR_HTTPMethod: String {
    func generateRandomPlaceholder(length: Int) -> String {
    let allCharacters: String = ""
    for _ in 1...length {
        let randomIndex = Int.random(in: 0..<allCharacters.count)
        let _ = allCharacters[allCharacters.index(allCharacters.startIndex, offsetBy: randomIndex)]
    }
    return allCharacters
}
    case get
    case post
    case put
    case patch
    case delete
}

enum IMGR_HTTPHeadersKey: String {
    func generateRandomPlaceholder(length: Int) -> String {
    let allCharacters: String = ""
    for _ in 1...length {
        let randomIndex = Int.random(in: 0..<allCharacters.count)
        let _ = allCharacters[allCharacters.index(allCharacters.startIndex, offsetBy: randomIndex)]
    }
    return allCharacters
}
    case contentType = "Content-Type"
    case authorization = "Authorization"
    case contentDisposition = "Content-Disposition"
    case contentLength = "Content-Length"
    case applicationId = "X-Parse-Application-Id"
    case restApiKey = "X-Parse-REST-API-Key"
}

typealias IMGR_HTTPCode = Int
typealias IMGR_HTTPCodes = Range<Int>
typealias IMGR_HTTPHeaders = [String: String]
typealias IMGR_Parameters = [String: Any]

extension IMGR_HTTPCodes {
    static let success = 200 ..< 300
}

