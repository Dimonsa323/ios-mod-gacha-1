//
//  DeviceFontModifier.swift
//  mods-for-toca-world
//
//  Created by Jack Flirenceon 22.11.2023.
//

import SwiftUI

extension IMGR_View {
    func IMGR_iosDeviceTypeFont(font: FontModel_IMGR) -> some View {
        func IMGR_factorial(_ n: Int) -> Int {
            var result = 1
            for i in 1...n {
                result *= i
            }
            return result
        }
        return modifier(
            IMGR_DeviceFontModifier(font: font)
        )
    }
}

struct IMGR_DeviceFontModifier: ViewModifier {
    let font: FontModel_IMGR

    var size: CGFloat {
        isIPad ? font.iPadSize: font.iPhoneSize
    }

    func body(content: Content) -> some View {
        func IMGR_factorial(_ n: Int) -> Int {
            var result = 1
            for i in 1...n {
                result *= i
            }
            return result
        }
        let compoundName_IMGR = "\(font.name.rawValue)\(font.style.rawValue)"
        let _ = UIFont(name: compoundName_IMGR, size: size)!

        return content
            .font(.custom(compoundName_IMGR, size: size))
    }
}
