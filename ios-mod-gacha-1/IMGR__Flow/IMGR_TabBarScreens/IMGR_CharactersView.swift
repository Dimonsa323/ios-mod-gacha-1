//
//  IMGR_CharactersView.swift
//  ios-mod-gacha-1
//
//  Created by Дима Губеня on 05.03.2024.
//

import SwiftUI
import FlowStacks

struct IMGR_CharactersView: View {
    @EnvironmentObject var navigator: FlowNavigator<IMGR_MainRoute>
    @State private var searchText = ""
    
    @FetchRequest<IMGR_ModsCD>(fetchRequest: .IMGR_mods())
    private var mods
    
    @FetchRequest<IMGR_CharacterCD>(fetchRequest: .IMGR_characters())
    private var characters
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        IMGR_ZStackWithBackground {
            VStack {
                HStack {
                    Spacer()
                    
                    Text("Characters")
                        .kerning(0.4)
                        .IMGR_iosDeviceTypeFont(font: .init(name: .comfortaa, style: .medium, iPhoneSize: 28, iPadSize: 56))
                        .foregroundColor(.black)
                        .IMGR_iosDeviceTypePadding(edge: .top, iOSPadding: 19, iPadPadding: 38)
                        .IMGR_iosDeviceTypePadding(edge: .leading, iOSPadding: 40, iPadPadding: 80)
                    //                        .frame(alignment: .trailing)
                    //    .border(.red)
                    //                        .IMGR_iosDeviceTypePadding(edge: .leading, iOSPadding: 63, iPadPadding: 126)
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Image(.property1Filters)
                            .resizable()
                            .frame(width: isIPad ? 48 : 24)
                            .frame(height: isIPad ? 48 : 24)
                            .IMGR_iosDeviceTypePadding(edge: .trailing, iOSPadding: 22, iPadPadding: 44)
                            .IMGR_iosDeviceTypePadding(edge: .top, iOSPadding: 22, iPadPadding: 44)
                    }
                }
                
                IMGR_CustomSearchBar_Ext(searchText: $searchText)
                    .IMGR_iosDeviceTypePadding(edge: .top, iOSPadding: 20, iPadPadding: 40)
                
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(characters) { character in
                            CardViewCharacter(imageURL: "/\(character.image ?? "")")
                        }
                        .background(.white)
                        .opacity(0.8)
                        .IMGR_cornerRadius_IMGR(isIPad ? 40 : 20, corners: .allCorners)
                        .overlay {
                            RoundedRectangle(cornerRadius: isIPad ? 40 : 20)
                                .stroke(.white, lineWidth: isIPad ? 2 : 1)
                        }
                    }
                    .IMGR_iosDeviceTypePadding(edge: .horizontal, iOSPadding: 8, iPadPadding: 16)
                }
                .IMGR_iosDeviceTypePadding(edge: .all, iOSPadding: 20, iPadPadding: 40)
            }
        }
    }
}

struct CardViewCharacter: View {
    
    //    let text: String
    let imageURL: String
    
    var body: some View {
        VStack {
            RemoteImage(url: imageURL, size: .init(width: 0, height: isIPad ? 452 : 226), image: .constant(nil), cornerRadius: isIPad ? 40 : 20)
            
                .IMGR_iosDeviceTypePadding(edge: .horizontal, iOSPadding: 8, iPadPadding: 16)
                .IMGR_iosDeviceTypePadding(edge: .top, iOSPadding: 8, iPadPadding: 16)
                .background(.whiteLight)
                .IMGR_cornerRadius_IMGR(20, corners: .allCorners)
            
            Text("Tittle")
                .kerning(0.5)
                .IMGR_iosDeviceTypeFont(font: .init(name: .comfortaa, style: .medium, iPhoneSize: 16, iPadSize: 32))
                .foregroundColor(.black)
                .IMGR_iosDeviceTypePadding(edge: .top, iOSPadding: 6, iPadPadding: 12)
                .IMGR_iosDeviceTypePadding(edge: .bottom, iOSPadding: 8, iPadPadding: 16)
        }
        .IMGR_iosDeviceTypePadding(edge: .horizontal, iOSPadding: 20, iPadPadding: 40)
    }
}

#Preview {
    IMGR_CharactersView()
        .environment(\.managedObjectContext, IMGR_CoreDataStoreMock.preview)
}
