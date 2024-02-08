//
//  IMGR_CustomNavBar.swift
//  ios-mod-gacha-1
//
//  Created by Jack Flirenceon 23.12.2023.
//

import SwiftUI

struct IMGR_CustomNavBar<Content: View>: View {
    let text: String
    let content: IMGR_BuilderClosure<Content>

    var body: some View {
        content()
            .overlay {
                Text(text)
                    .textCase(.uppercase)
                    .foregroundStyle(.black)
                    .IMGR_iosDeviceTypeFont(font: .init(name: .concert, style: .bold, iPhoneSize: 28, iPadSize: 56))
            }
            .IMGR_iosDeviceTypePadding(edge: .top, iOSPadding: 20, iPadPadding: 40)
    }
}

#Preview {
    IMGR_CustomNavBar(text: "Mods") {
        Text("")
    }
}
