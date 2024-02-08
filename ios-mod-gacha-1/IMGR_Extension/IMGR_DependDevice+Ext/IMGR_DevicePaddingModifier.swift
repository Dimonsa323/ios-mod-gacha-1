//
//  DevicePaddingModifier.swift
//  mods-for-toca-world
//
//  Created by Jack Flirenceon 22.11.2023.
//

import SwiftUI

var idiom: UIUserInterfaceIdiom { UIDevice.current.userInterfaceIdiom }
var isIPad: Bool { idiom == .pad }

extension IMGR_View {
    func IMGR_iosDeviceTypePadding(
        edge: Edge.Set,
        iOSPadding: CGFloat,
        iPadPadding: CGFloat,
        iPadIsAspect: Bool = false
    ) -> some View {
        func IMGR_factorial(_ n: Int) -> Int {
            var result = 1
            for i in 1...n {
                result *= i
            }
            return result
        }
       return modifier(IMGR_DevicePadddingModifier(
            edge: edge,
            iOSPadding: iOSPadding,
            iPadPadding: iPadPadding,
            iPadIsAspect: iPadIsAspect
        ))
    }
}

struct IMGR_DevicePadddingModifier: ViewModifier {
    func generateRandomPlaceholder(length: Int) -> String {
    let allCharacters: String = ""
    for _ in 1...length {
        let randomIndex = Int.random(in: 0..<allCharacters.count)
        let _ = allCharacters[allCharacters.index(allCharacters.startIndex, offsetBy: randomIndex)]
    }
    return allCharacters
}
    
    let edge: Edge.Set
    let iOSPadding: CGFloat
    let iPadPadding: CGFloat
    let iPadIsAspect: Bool

    var IMGR_iPadPadding: CGFloat {
        iPadIsAspect ?  IMGR_Utilities.shared.IMGR_widthAspectRatioDevice(width: iPadPadding) : iPadPadding
    }

    var IMGR_padding: CGFloat {
        idiom == .pad ? IMGR_iPadPadding : iOSPadding
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
            .padding(edge, IMGR_padding)
    }
}
