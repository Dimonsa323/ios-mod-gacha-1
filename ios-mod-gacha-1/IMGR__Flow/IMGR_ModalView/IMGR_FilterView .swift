//
//  IMGR_FilterView .swift
//  ios-mod-gacha-1
//
//  Created by Дима Губеня on 06.03.2024.
//

import SwiftUI
import FlowStacks

struct IMGR_FilterView: View {
    @EnvironmentObject var navigator: FlowNavigator<IMGR_MainRoute>
    
    @State private var isNewSelected = true
    @State private var isAllSelected = false
    @State private var isTopSelected = false
    @State private var isFavoritesSelected = false
    
    var body: some View {
        VStack {
            HStack() {
                Spacer()
                Text("Filter")
                    .kerning(0.7)
                    .IMGR_iosDeviceTypeFont(font: .init(name: .comfortaa, style: .bold, iPhoneSize: 20, iPadSize: 40))
                
                Button {
                    navigator.goBack()
                } label: {
                    Image(.xmark2)
                }
                .IMGR_iosDeviceTypePadding(edge: .leading, iOSPadding: 105, iPadPadding: 210)
            }
            .IMGR_iosDeviceTypePadding(edge: .vertical, iOSPadding: 20, iPadPadding: 40)
            .IMGR_iosDeviceTypePadding(edge: .horizontal, iOSPadding: 12, iPadPadding: 24)
            
            VStack {
                HStack {
                    Button {
                        isNewSelected.toggle()
                    } label: {
                        Text("New")
                            .kerning(0.5)
                            .IMGR_iosDeviceTypeFont(font: .init(name: .comfortaa, style: .medium, iPhoneSize: 16, iPadSize: 32))
                            .IMGR_iosDeviceTypePadding(edge: .horizontal, iOSPadding: 21, iPadPadding: 42)
                            .IMGR_iosDeviceTypePadding(edge: .vertical, iOSPadding: 7, iPadPadding: 14)
                            .background(isNewSelected ? Color.secondary1 : Color.white)
                            .foregroundColor(isNewSelected ? Color.white : Color.secondary1)
                            .IMGR_cornerRadius_IMGR(isIPad ? 24 : 12, corners: .allCorners)
                    }
                    .IMGR_iosDeviceTypePadding(edge: .trailing, iOSPadding: 12, iPadPadding: 24)
                    
                    Button {
                        isAllSelected.toggle()
                    } label: {
                        Text("All")
                            .kerning(0.5)
                            .IMGR_iosDeviceTypeFont(font: .init(name: .comfortaa, style: .medium, iPhoneSize: 16, iPadSize: 32))
                            .IMGR_iosDeviceTypePadding(edge: .horizontal, iOSPadding: 21, iPadPadding: 42)
                            .IMGR_iosDeviceTypePadding(edge: .vertical, iOSPadding: 7, iPadPadding: 14)
                            .background(isAllSelected ? Color.secondary1 : Color.white)
                            .foregroundColor(isAllSelected ? Color.white : Color.secondary1)
                            .IMGR_cornerRadius_IMGR(isIPad ? 24 : 12, corners: .allCorners)
                    }
                    .IMGR_iosDeviceTypePadding(edge: .trailing, iOSPadding: 12, iPadPadding: 24)
                    
                    Button {
                        isTopSelected.toggle()
                    } label: {
                        Text("Top")
                            .kerning(0.5)
                            .IMGR_iosDeviceTypeFont(font: .init(name: .comfortaa, style: .medium, iPhoneSize: 16, iPadSize: 32))
                            .IMGR_iosDeviceTypePadding(edge: .horizontal, iOSPadding: 21, iPadPadding: 42)
                            .IMGR_iosDeviceTypePadding(edge: .vertical, iOSPadding: 7, iPadPadding: 14)
                            .background(isTopSelected ? Color.secondary1 : Color.white)
                            .foregroundColor(isTopSelected ? Color.white : Color.secondary1)
                            .IMGR_cornerRadius_IMGR(isIPad ? 24 : 12, corners: .allCorners)
                    }
                }
                .IMGR_iosDeviceTypePadding(edge: .horizontal, iOSPadding: 44, iPadPadding: 88)
                
                HStack {
                    Button {
                        isFavoritesSelected.toggle()
                    } label: {
                        Text("Favorites")
                            .kerning(0.5)
                            .IMGR_iosDeviceTypeFont(font: .init(name: .comfortaa, style: .medium, iPhoneSize: 16, iPadSize: 32))
                            .IMGR_iosDeviceTypePadding(edge: .horizontal, iOSPadding: 21, iPadPadding: 42)
                            .IMGR_iosDeviceTypePadding(edge: .vertical, iOSPadding: 7, iPadPadding: 14)
                            .background(isFavoritesSelected ? Color.secondary1 : Color.white)
                            .foregroundColor(isFavoritesSelected ? Color.white : Color.secondary1)
                            .IMGR_cornerRadius_IMGR(isIPad ? 24 : 12, corners: .allCorners)
                    }
                    //                    .IMGR_iosDeviceTypePadding(edge: .trailing, iOSPadding: 107, iPadPadding: 200)
                    
                }
                .IMGR_iosDeviceTypePadding(edge: .top, iOSPadding: 12, iPadPadding: 24)
                //      .IMGR_iosDeviceTypePadding(edge: .horizontal, iOSPadding: 20, iPadPadding: 40)
            //    .border(.red)
                .offset(x: -75)
            }
            .IMGR_iosDeviceTypePadding(edge: .bottom, iOSPadding: 20, iPadPadding: 40)
        }
        .frame(width: 350)
        .IMGR_cornerRadius_IMGR(isIPad ? 48 : 24, corners: .allCorners)
    }
}

#Preview {
    IMGR_FilterView()
}
