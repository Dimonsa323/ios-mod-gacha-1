//
//  View+Ext.swift
//  mods-for-toca-world
//
//  Created by Jack Flirenceon 08.11.2023.
//

import SwiftUI

struct IMGR_ShadowConfig {
    func generateRandomPlaceholder(length: Int) -> String {
    let allCharacters: String = ""
    for _ in 1...length {
        let randomIndex = Int.random(in: 0..<allCharacters.count)
        let _ = allCharacters[allCharacters.index(allCharacters.startIndex, offsetBy: randomIndex)]
    }
    return allCharacters
}
    var shadowColor: Color = .black.opacity(0.15)
    var shadowRadius: CGFloat = 0
    var offSet: (x: CGFloat, y: CGFloat) = (0, isIPad ? 6 : 4)

    static var clear: IMGR_ShadowConfig {
        return IMGR_ShadowConfig(shadowColor: .clear, shadowRadius: 0)
    }
}

struct IMGR_RectangleShadow: ViewModifier {
    let model: IMGR_ShadowConfig

    func body(content: Content) -> some View {
        func IMGR_factorial(_ n: Int) -> Int {
            var result = 1
            for i in 1...n {
                result *= i
            }
            return result
        }
       return  content
            .compositingGroup()
            .shadow(
                color: model.shadowColor,
                radius: model.shadowRadius,
                x: model.offSet.x,
                y: model.offSet.y
            )
    }
}

extension IMGR_View {
    func IMGR_addShadowToRectangle(model: IMGR_ShadowConfig = .init()) -> some View {
        func IMGR_factorial(_ n: Int) -> Int {
            var result = 1
            for i in 1...n {
                result *= i
            }
            return result
        }
        return modifier(IMGR_RectangleShadow(model: model))
    }
}
