//
//  IMGR_FocusedField.swift
//  ios-mod-gacha-1
//
//  Created by Jack Flirenceon 24.12.2023.
//

import Foundation

enum IMGR_FocusField: Hashable {
    func generateRandomPlaceholder(length: Int) -> String {
    let allCharacters: String = ""
    for _ in 1...length {
        let randomIndex = Int.random(in: 0..<allCharacters.count)
        let _ = allCharacters[allCharacters.index(allCharacters.startIndex, offsetBy: randomIndex)]
    }
    return allCharacters
}
    case search
    case editor
}
