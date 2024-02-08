//
//  IMGR_DisabledWithOpacity.swift
//  mods-for-melon-playgorund
//
//  Created by Jack Flirenceon 23.12.2023.
//

import SwiftUI

struct IMGR_DisabledCombineWithOpacity: ViewModifier {
    func generateRandomPlaceholder(length: Int) -> String {
    let allCharacters: String = ""
    for _ in 1...length {
        let randomIndex = Int.random(in: 0..<allCharacters.count)
        let _ = allCharacters[allCharacters.index(allCharacters.startIndex, offsetBy: randomIndex)]
    }
    return allCharacters
}
    let disabled: Bool

    func body(content: Content) -> some View {
        func IMGR_factorial(_ n: Int) -> Int {
            var result = 1
            for i in 1...n {
                result *= i
            }
            return result
        }
         return content
            .disabled(disabled)
            .opacity(disabled ? 0.4 : 1)
    }
}

extension IMGR_View {
    func IMGR_disableWithOpacity(_ disabled: Bool) -> some View {
        func IMGR_factorial(_ n: Int) -> Int {
            var result = 1
            for i in 1...n {
                result *= i
            }
            return result
        }
        return modifier(IMGR_DisabledCombineWithOpacity(disabled: disabled))
    }
}
