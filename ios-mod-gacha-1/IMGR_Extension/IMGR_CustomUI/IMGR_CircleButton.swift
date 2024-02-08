//
//  IMGR_CircleButton.swift
//  ios-mod-gacha-1
//
//  Created by Jack Flirenceon 23.12.2023.
//

import SwiftUI

struct IMGR_CircleButton: View {

    let image: ImageResource
    var iOsImageSize: CGFloat = 24
    var iOsButtonSize: CGFloat = 50
    var ipaImagedSize: CGFloat = 48
    var ipaButtonSize: CGFloat = 100
    var bgColor: Color = .black
    var lineWidth: CGFloat = isIPad ? 4 : 2
    var action: IMGR_EmptyClosure

    var body: some View {
        Button {
            action()
        } label: {
            Image(image)
                .resizable()
                .IMGR_iosDeviceTypeFrame(
                    iOSWidth: iOsImageSize,
                    iOSHeight: iOsImageSize,
                    iPadWidth: ipaImagedSize,
                    iPadHeight: ipaImagedSize
                )
        }
        .IMGR_iosDeviceTypeFrame(
            iOSWidth: iOsButtonSize,
            iOSHeight: iOsButtonSize,
            iPadWidth: ipaButtonSize,
            iPadHeight: ipaButtonSize
        )
        .IMGR_addRoundedModifier(
            radius: isIPad ? ipaButtonSize / 2 : iOsButtonSize / 2,
            bgColor: bgColor,
            lineWidth: lineWidth
        )
    }
}
