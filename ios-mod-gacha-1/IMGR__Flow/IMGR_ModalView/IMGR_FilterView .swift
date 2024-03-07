//
//  IMGR_FilterView .swift
//  ios-mod-gacha-1
//
//  Created by Дима Губеня on 06.03.2024.
//

import SwiftUI
import FlowStacks

struct IMGR_FilterView_: View {
    @EnvironmentObject var navigator: FlowNavigator<IMGR_MainRoute>
    
    var body: some View {
        VStack {
            HStack() {
                
                Text("Filter")
                    .kerning(1.0)
                    .IMGR_iosDeviceTypeFont(font: .init(name: .comfortaa, style: .bold, iPhoneSize: 20, iPadSize: 40))
                
                Button {
                    navigator.goBack()
                } label: {
                    Image(.xmark2)
                }
                //            .padding(.trailing, 20)
            }
            .border(.red)
            .padding(.horizontal, 24)
            
            VStack {
                HStack {
                    Button {
                        //
                    } label: {
                        Text("New")
                            .IMGR_iosDeviceTypeFont(font: .init(name: .comfortaa, style: .medium, iPhoneSize: 16, iPadSize: 32))
                            .padding(.horizontal, 21)
                            .padding(.vertical, 7)
                            .background(.secondary1)
                            .foregroundColor(.white)
                            .IMGR_cornerRadius_IMGR(isIPad ? 24 : 12, corners: .allCorners)
                    }
                    
                    Button {
                        //
                    } label: {
                        Text("All")
                            .IMGR_iosDeviceTypeFont(font: .init(name: .comfortaa, style: .medium, iPhoneSize: 16, iPadSize: 32))
                            .padding(.horizontal, 21)
                            .padding(.vertical, 7)
                            .background(.white)
                            .foregroundColor(.secondary1)
                            .IMGR_cornerRadius_IMGR(isIPad ? 24 : 12, corners: .allCorners)
                    }
                    
                    Button {
                        //
                    } label: {
                        Text("Top")
                            .IMGR_iosDeviceTypeFont(font: .init(name: .comfortaa, style: .medium, iPhoneSize: 16, iPadSize: 32))
                            .padding(.horizontal, 21)
                            .padding(.vertical, 7)
                            .background(.white)
                            .foregroundColor(.secondary1)
                            .IMGR_cornerRadius_IMGR(isIPad ? 24 : 12, corners: .allCorners)
                    }
                }
                
                HStack {
                    Button {
                        //
                    } label: {
                        Text("Favorites")
                            .kerning(0.5)
                            .IMGR_iosDeviceTypeFont(font: .init(name: .comfortaa, style: .medium, iPhoneSize: 16, iPadSize: 32))
                            .padding(.horizontal, 21)
                            .padding(.vertical, 7)
                            .background(.white)
                            .foregroundColor(.secondary1)
                            .IMGR_cornerRadius_IMGR(isIPad ? 24 : 12, corners: .allCorners)
                    }
                }
                
            //    .padding(.trailing, 107)
            }
        }
        .frame(width: 350, height: 160, alignment: .center)
        .border(.red)
    }
}

#Preview {
    IMGR_FilterView_()
}
