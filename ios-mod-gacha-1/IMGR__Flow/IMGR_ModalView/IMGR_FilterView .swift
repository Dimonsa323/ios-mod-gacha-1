//
//  IMGR_FilterView .swift
//  ios-mod-gacha-1
//
//  Created by Дима Губеня on 06.03.2024.
//

import SwiftUI

struct IMGR_FilterView_: View {
    var body: some View {
        HStack {
            Text("Filter")
                .kerning(1.0)
                .IMGR_iosDeviceTypeFont(font: .init(name: .comfortaa, style: .bold, iPhoneSize: 20, iPadSize: 40))
            
            Button {
                //
            } label: {
                Image(.xmark2)
            }

        }
    }
}

#Preview {
    IMGR_FilterView_()
}
