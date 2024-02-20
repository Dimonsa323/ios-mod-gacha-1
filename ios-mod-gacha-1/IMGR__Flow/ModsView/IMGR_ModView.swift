//
//  CharactersView.swift
//  ios-mod-gacha-ref-0-1
//
//  Created by Дима Губеня on 29.12.2023.
//

import SwiftUI

struct IMGR_ModView: View {
    var textMod: String = """
Lorem ipsum dolor sit amet, consectetur adipisci elit, sed eiusmod tempor incidunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrum...

Lorem ipsum dolor sit amet, consectetur adipisci elit, sed eiusmod tempor incidunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrum Lorem ipsum dolor sit amet,

Сonsectetur adipisci elit, sed eiusmod tempor incidulabore et dolore magna Lorem ipsum dolor sit amet, consectetur adipisci elit, sed eius, amet consectetur adipisci elit, sed eiusmod."
"""
    var body: some View {
        IMGR_ZStackWithBackground {
            
            VStack(spacing: 0) {
                navBarView
                
                GeometryReader { geometry in
                    ScrollView() {
                        contentView(geo: geometry)
                        
                    }
                }
            }
        }
    }
}

//MARK: Child Views
private extension IMGR_ModView {
    
    //MARK: - Mod List View
    
    @ViewBuilder
    var navBarView: some View {
        HStack {
            Button {
                //
            } label: {
#warning("IMAGE")
                Image(.navBarBack)
                    .resizable()
                    .IMGR_iosDeviceTypeFrame(iOSWidth: 24, iOSHeight: 24, iPadWidth: 48, iPadHeight: 48)
            }
            
            Spacer()
            
            Text("Mod")
                .kerning(1.4)
                .foregroundStyle(.black)
                .IMGR_iosDeviceTypeFont(font: .init(name: .comfortaa, style: .regular, iPhoneSize: 28, iPadSize: 56))
            
            Spacer()
            
            Button {
                //
            } label: {
#warning("IMAGE")
                Image(.starFavorite)
                    .resizable()
                    .IMGR_iosDeviceTypeFrame(iOSWidth: 44, iOSHeight: 44, iPadWidth: 88, iPadHeight: 88)
            }
            
        }
        .IMGR_iosDeviceTypePadding(edge: .horizontal, iOSPadding: 20, iPadPadding: 40)
    }
    
    func contentView(geo: GeometryProxy) -> some View {
        VStack {
#warning("IMAGE")
            Image(.carrdBig)
                .resizable()
                .IMGR_cornerRadius_IMGR(isIPad ? 40 : 20, corners: .allCorners)
                .IMGR_iosDeviceTypePadding(edge: .top, iOSPadding: 20, iPadPadding: 40)
                .IMGR_iosDeviceTypePadding(edge: .horizontal, iOSPadding: 20, iPadPadding: 40)
                .IMGR_iosDeviceTypeFrameAspec(iOSHeight: 200, iPadHeight: 400)
            
                VStack(spacing: 0) {
                    Text("Tittle")
                        .kerning(1)
                        .foregroundColor(.secondary1)
                        .IMGR_iosDeviceTypeFont(font: .init(name: .comfortaa, style: .bold, iPhoneSize: 20, iPadSize: 40))
                    
                    Text(textMod)
                        .kerning(0.7)
                        .foregroundColor(.black)
                        .IMGR_iosDeviceTypeFont(font: .init(name: .comfortaa, style: .medium, iPhoneSize: 14, iPadSize: 28))
                        .IMGR_iosDeviceTypePadding(edge: .top, iOSPadding: 8, iPadPadding: 16)
                }
            .IMGR_iosDeviceTypePadding(edge: .all, iOSPadding: 16, iPadPadding: 32)
            
            .background(.tintWhite)
            .IMGR_cornerRadius_IMGR(isIPad ? 40 : 20, corners: .allCorners)
            .IMGR_iosDeviceTypePadding(edge: .horizontal, iOSPadding: 16, iPadPadding: 32)
            .IMGR_iosDeviceTypePadding(edge: .top, iOSPadding: 8, iPadPadding: 24)
            
            Spacer()
            
            Button {
                //
            } label: {
                HStack {
                    Text("Download")
                        .kerning(1)
                        .IMGR_iosDeviceTypeFont(font: .init(name: .comfortaa, style: .bold, iPhoneSize: 20, iPadSize: 40))
#warning("IMAGE")
                    Image(.property1Download)
                }
                
                .frame(maxWidth: .infinity)
            }
            .IMGR_iosDeviceTypeFrame(iOSHeight: 48, iPadHeight: 72)
            .foregroundStyle(Color.white)
            .background(.secondary1)
            .IMGR_cornerRadius_IMGR(isIPad ? 40 : 20, corners: .allCorners)
            .IMGR_iosDeviceTypePadding(edge: .horizontal, iOSPadding: 20, iPadPadding: 40)
            .IMGR_iosDeviceTypePadding(edge: .top, iOSPadding: 32, iPadPadding: 64)
        }
        .IMGR_iosDeviceTypePadding(edge: .vertical, iOSPadding: 12, iPadPadding: 24)

        .frame(minHeight: geo.size.height)
    }
}


#Preview {
    IMGR_ModView()
}


