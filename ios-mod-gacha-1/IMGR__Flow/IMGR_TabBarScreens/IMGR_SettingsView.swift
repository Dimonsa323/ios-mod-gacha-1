//
//  SettingsView.swift
//  ios-mod-gacha-ref-0-1
//
//  Created by Дима Губеня on 03.01.2024.
//
//
import SwiftUI

struct IMGR_SettingsView: View {
    var body: some View {
        IMGR_ZStackWithBackground {
            VStack {
                Text("Settings")
                    .kerning(0.4)
                    .IMGR_iosDeviceTypeFont(font: .init(name: .comfortaa, style: .medium, iPhoneSize: 28, iPadSize: 56))
                    .foregroundColor(.settingsViolet)
                    .IMGR_iosDeviceTypePadding(edge: .vertical, iOSPadding: 20, iPadPadding: 40)
                
                VStack() {
                    Button {
                        
                    } label: {
                        Text("Privacy Policy")
                            .kerning(0.7)
                            .IMGR_iosDeviceTypeFont(font: .init(name: .comfortaa, style: .bold, iPhoneSize: 16, iPadSize: 32))
                            .foregroundColor(.lightBlackTwo)
                            .IMGR_iosDeviceTypePadding(edge: .leading, iOSPadding: 20, iPadPadding: 40)
                            .IMGR_iosDeviceTypePadding(edge: .vertical, iOSPadding: 19, iPadPadding: 38)
                        
                        Spacer()
                        
                        Image(.arrowRightSmall)
                            .IMGR_iosDeviceTypePadding(edge: .trailing, iOSPadding: 12, iPadPadding: 24)
                            .IMGR_iosDeviceTypePadding(edge: .vertical, iOSPadding: 12, iPadPadding: 24)
                    }
//                    .IMGR_iosDeviceTypePadding(edge: .horizontal, iOSPadding: 20, iPadPadding: 40)
                    .background(.white)
                    .IMGR_iosDeviceTypeFrame(iOSHeight: 56, iPadHeight: 112)
                    .IMGR_cornerRadius_IMGR(isIPad ? 60 : 30, corners: .allCorners)
                    .overlay {
                        RoundedRectangle(cornerRadius: isIPad ? 60 : 30)
                            .stroke(.clearWhite, lineWidth: isIPad ? 12 : 6)
                         
                    }
                    
                    Button {
                        
                    } label: {
                    Text("Terms of use")
                            .kerning(0.7)
                            .IMGR_iosDeviceTypeFont(font: .init(name: .comfortaa, style: .bold, iPhoneSize: 16, iPadSize: 32))
                            .foregroundColor(.lightBlackTwo)
                            .IMGR_iosDeviceTypePadding(edge: .leading, iOSPadding: 20, iPadPadding: 40)
                            .IMGR_iosDeviceTypePadding(edge: .vertical, iOSPadding: 19, iPadPadding: 38)
                        
                        Spacer()
                        
                        Image(.arrowRightSmall)
                            .IMGR_iosDeviceTypePadding(edge: .trailing, iOSPadding: 12, iPadPadding: 24)
                            .IMGR_iosDeviceTypePadding(edge: .vertical, iOSPadding: 12, iPadPadding: 24)
                    }
                    .background(.white)
                    .IMGR_iosDeviceTypeFrame(iOSHeight: 56, iPadHeight: 112)
                    .IMGR_cornerRadius_IMGR(isIPad ? 60 : 30, corners: .allCorners)
                    .overlay {
                        RoundedRectangle(cornerRadius: isIPad ? 60 : 30)
                            .stroke(.clearWhite, lineWidth: isIPad ? 12 : 6)
                    }
                    .IMGR_iosDeviceTypePadding(edge: .top, iOSPadding: 3, iPadPadding: 6)
                }
                Spacer()
            }
            .IMGR_iosDeviceTypePadding(edge: .horizontal, iOSPadding: 20, iPadPadding: 40)
           // .border(.red)
        }
    }
}

#Preview {
    IMGR_SettingsView()
        .environment(\.managedObjectContext, IMGR_CoreDataStoreMock.preview)
}
