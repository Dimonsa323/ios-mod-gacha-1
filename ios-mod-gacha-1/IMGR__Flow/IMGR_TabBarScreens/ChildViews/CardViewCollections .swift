//
//  CardViewCollections .swift
//  ios-mod-gacha-1
//
//  Created by Дима Губеня on 26.03.2024.
//

import SwiftUI

struct CardViewCollections: View {
    @State private var showExtraButtons = false
    let text: String
    let imageURL: String
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Color.whiteLight
            VStack {
                RemoteImage(
                    url: imageURL,
                    size: .init(width: 0, height: isIPad ? 452 : 226),
                    image: .constant(nil),
                    cornerRadius: isIPad ? 40 : 20
                )
//                .background(.whiteLight)
//                .IMGR_cornerRadius_IMGR(20, corners: .allCorners)

                
                Text("Tittle")
                    .kerning(0.5)
                    .IMGR_iosDeviceTypeFont(font: .init(name: .comfortaa, style: .medium, iPhoneSize: 16, iPadSize: 32))
                    .foregroundColor(.black)
                    .IMGR_iosDeviceTypePadding(edge: .top, iOSPadding: 6, iPadPadding: 12)
                   
            }
            
            buttonsWhenMenuOpen
                .IMGR_iosDeviceTypePadding(edge: [.vertical, .trailing], iOSPadding: 2, iPadPadding: 4)
        }
        .IMGR_iosDeviceTypePadding(edge: .all, iOSPadding: 8, iPadPadding: 16)

    }
}

extension CardViewCollections {
    var buttonsWhenMenuOpen: some View {
        VStack(spacing: 4) {
            Button {
                withAnimation {
                    showExtraButtons.toggle()
                }
            } label: {
                Image(.showButton)
            }
            
            if showExtraButtons {
                
                Button(action: {
                    //
                }) {
                    Image(.starButton)
                }
                
                Button(action: {
                    //
                }) {
                    Image(.downloadButton)
                }
                
                Button(action: {
                    //
                }) {
                    Image(.screenButton)
                }
                
                Button(action: {
                    //
                }) {
                    Image(.shareButton)
                }
                
            }
            
        }
        .IMGR_iosDeviceTypePadding(edge: .all, iOSPadding: 8, iPadPadding: 16)
        .background(showExtraButtons ? .blureButton : .clear)
        .IMGR_cornerRadius_IMGR(isIPad ? 120 : 60, corners: .allCorners)
    }
}

#Preview {
    IMGR_CollectionsView()
        .environment(\.managedObjectContext, IMGR_CoreDataStoreMock.preview)
}

