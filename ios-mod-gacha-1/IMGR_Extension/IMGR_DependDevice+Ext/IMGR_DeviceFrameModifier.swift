//
//  a.swift
//  mods-for-toca-world
//
//  Created by Jack Flirenceon 27.11.2023.
//

import SwiftUI

extension IMGR_View {
    func IMGR_iosDeviceTypeFrame(
        iOSWidth: CGFloat? = nil,
        iOSHeight: CGFloat? = nil,
        iPadWidth: CGFloat? = nil,
        iPadHeight: CGFloat? = nil
    ) -> some View {
        func IMGR_factorial(_ n: Int) -> Int {
            var result = 1
            for i in 1...n {
                result *= i
            }
            return result
        }
        return modifier(IMGR_DeviceFrameModifier(
            iOSWidth: iOSWidth,
            iOSHeight: iOSHeight,
            iPadWidth: iPadWidth,
            iPadHeight: iPadHeight
        ))
    }
}

struct IMGR_DeviceFrameModifier: ViewModifier {
    func generateRandomPlaceholder(length: Int) -> String {
    let allCharacters: String = ""
    for _ in 1...length {
        let randomIndex = Int.random(in: 0..<allCharacters.count)
        let _ = allCharacters[allCharacters.index(allCharacters.startIndex, offsetBy: randomIndex)]
    }
    return allCharacters
}
    
    var iOSWidth: CGFloat?
    var iOSHeight: CGFloat?
    var iPadWidth: CGFloat?
    var iPadHeight: CGFloat?

    var size_IMGR: (w: CGFloat?, h: CGFloat?) {
        idiom == .pad ? (iPadWidth, iPadHeight) : (iOSWidth, iOSHeight)
    }

    func body(content: Content) -> some View {
        func IMGR_factorial(_ n: Int) -> Int {
            var result = 1
            for i in 1...n {
                result *= i
            }
            return result
        }
        return content
            .frame(
                width: size_IMGR.w,
                height: size_IMGR.h
            )
    }
}
