//
//  HomeView.swift
//  ios-mod-gacha-ref-0-1
//
//  Created by Дима Губеня on 29.12.2023.
//

import SwiftUI

struct IMGR_HomeView: View {
    @State private var searchText = ""
    
    var body: some View {
        IMGR_ZStackWithBackground {
            VStack(spacing: 0) {
               IMGR_CustomSearchBar_Ext(searchText: $searchText)
                    .IMGR_iosDeviceTypePadding(edge: .top, iOSPadding: 20, iPadPadding: 40)
                
                modsListView
                outfitIdeasView
                collectionsView
                
                Spacer()
            }
        }
    }
}

// MARK: Child Views

private extension IMGR_HomeView {
    @ViewBuilder
    
    //MARK: - Mod List View
    
    var modsListView: some View {
        HStack(spacing: 0) {
            Text("Mods")
                .kerning(1)
                .IMGR_iosDeviceTypeFont(font: .init(name: .comfortaa, style: .bold, iPhoneSize: 20, iPadSize: 40))
            
            
            Spacer()
            
            Button {
                //
            } label: {
                Text("See All")
                    .kerning(0.8)
                    .foregroundStyle(Color.black)
                    .IMGR_iosDeviceTypeFont(font: .init(name: .comfortaa, style: .medium, iPhoneSize: 16, iPadSize: 32))
            }
        }
        .IMGR_iosDeviceTypePadding(edge:.horizontal, iOSPadding: 20, iPadPadding: 40)
        .IMGR_iosDeviceTypePadding(edge: .top, iOSPadding: 20, iPadPadding: 40)
        ScrollView(.horizontal, showsIndicators: false) {
            HStack() {
                ForEach(0..<5) { index in
                    VStack(alignment: .leading) {
                        #warning("IMAGE")
                        Image(.moko)
                            .resizable()
                            .IMGR_cornerRadius_IMGR(isIPad ? 32 : 16, corners: .allCorners)
                            .IMGR_iosDeviceTypePadding(edge: .all, iOSPadding: 12, iPadPadding: 24)
                        Text("Mod Name \(index + 1)")
                            .kerning(1)
                            .IMGR_iosDeviceTypeFont(font: .init(name: .comfortaa, style: .bold, iPhoneSize: 20, iPadSize: 40))
                            .IMGR_iosDeviceTypePadding(edge: [.bottom, .leading], iOSPadding: 12, iPadPadding: 24)
                    }
                    .background(.modsCellBackground)
                    .IMGR_cornerRadius_IMGR(isIPad ? 32 : 16, corners: .allCorners)
                    .IMGR_iosDeviceTypePadding(edge: .trailing, iOSPadding: 4, iPadPadding: 8)
                }
            }
            .IMGR_iosDeviceTypePadding(edge: .top, iOSPadding: 12, iPadPadding: 24)
            .IMGR_iosDeviceTypePadding(edge: .horizontal, iOSPadding: 20, iPadPadding: 40)
            
        }
        .IMGR_iosDeviceTypeFrameAspec(iOSHeight: 220, iPadHeight: 440)
    }
    
    //MARK: - Outfit Ideas View
    
    var outfitIdeasView: some View {
        VStack {
            HStack(spacing: 0) {
                Text("Outfit ideas")
                    .kerning(1)
                    .IMGR_iosDeviceTypeFont(font: .init(name: .comfortaa, style: .bold, iPhoneSize: 20, iPadSize: 40))
                
                Spacer()
                
                Button {
                    //
                } label: {
                    Text("See All")
                        .kerning(0.8)
                        .foregroundStyle(Color.black)
                        .IMGR_iosDeviceTypeFont(font: .init(name: .comfortaa, style: .medium, iPhoneSize: 16, iPadSize: 32))
                }
            }
            .IMGR_iosDeviceTypePadding(edge: .horizontal, iOSPadding: 20, iPadPadding: 40)
            .IMGR_iosDeviceTypePadding(edge: .top, iOSPadding: 20, iPadPadding: 40)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack() {
                    ForEach(0..<10) { index in
                        #warning("IMAGE")
                        Image(.mocoImage2)
                            .resizable()
                            .IMGR_cornerRadius_IMGR(20, corners: .allCorners)
                            .IMGR_iosDeviceTypePadding(edge: .all, iOSPadding: 8, iPadPadding: 16)
                            .background(.whiteLight)
                            .IMGR_cornerRadius_IMGR(20, corners: .allCorners)
                    }
                }
                .IMGR_iosDeviceTypePadding(edge: .top, iOSPadding: 12, iPadPadding: 24)
                .IMGR_iosDeviceTypePadding(edge: .horizontal, iOSPadding: 20, iPadPadding: 40)
                
            }
            .IMGR_iosDeviceTypeFrameAspec(iOSHeight: 242, iPadHeight: 484)
        }
    }
    
    //MARK: - Collections View
    
    var collectionsView: some View {
        HStack(spacing: 0) {
            Text("Collections")
                .kerning(1)
                .IMGR_iosDeviceTypeFont(font: .init(name: .comfortaa, style: .bold, iPhoneSize: 20, iPadSize: 40))
            
            Spacer()
            
            Button {
                //
            } label: {
                Text("See All")
                    .kerning(0.8)
                    .foregroundStyle(Color.black)
                    .IMGR_iosDeviceTypeFont(font: .init(name: .comfortaa, style: .medium, iPhoneSize: 16, iPadSize: 32))
            }
        }
        .IMGR_iosDeviceTypePadding(edge: .horizontal, iOSPadding: 20, iPadPadding: 40)
        .IMGR_iosDeviceTypePadding(edge: .top, iOSPadding: 24, iPadPadding: 48)
        
    }
}

#Preview {
    IMGR_HomeView()
}
