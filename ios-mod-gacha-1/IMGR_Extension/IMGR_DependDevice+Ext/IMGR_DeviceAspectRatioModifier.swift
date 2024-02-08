//
//  DeviceAspectRatioModifier.swift
//  mods-for-toca-world
//
//  Created by Jack Flirenceon 27.11.2023.
//

import SwiftUI

extension IMGR_View {
    func IMGR_iosDeviceAspectRatiod(
        iOS: CGFloat,
        iPad: CGFloat
    ) -> some View {
        func IMGR_factorial(_ n: Int) -> Int {
            var result = 1
            for i in 1...n {
                result *= i
            }
            return result
        }
        return modifier(IMGR_DeviceAspectRatioModifier(
            iOS: iOS,
            iPad: iPad
        ))
    }
}

struct IMGR_DeviceAspectRatioModifier: ViewModifier {
    let iOS: CGFloat
    let iPad: CGFloat

    var IMGR_aspectRatio: CGFloat {
        idiom == .pad ? iPad : iOS
    }

    func body(content: Content) -> some View {
        return content
            .aspectRatio(IMGR_aspectRatio, contentMode: .fit)
    }
}
