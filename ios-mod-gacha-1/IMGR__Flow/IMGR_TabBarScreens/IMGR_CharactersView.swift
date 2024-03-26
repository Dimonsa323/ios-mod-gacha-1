//
//  IMGR_CharactersView.swift
//  ios-mod-gacha-1
//
//  Created by Дима Губеня on 05.03.2024.
//

import SwiftUI
import FlowStacks

struct IMGR_CharactersView: View {
    @EnvironmentObject private var navigator: FlowNavigator<IMGR_MainRoute>
    @State private var searchText = ""
    
    @FetchRequest<IMGR_CharacterCD>(fetchRequest: .IMGR_characters())
    private var characters
    
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        IMGR_ZStackWithBackground {
            VStack {
                navBar
                IMGR_CustomSearchBar_Ext(searchText: $searchText)
                    .IMGR_iosDeviceTypePadding(edge: .top, iOSPadding: 20, iPadPadding: 40)
                charactersList
                    .IMGR_iosDeviceTypePadding(edge: .all, iOSPadding: 20, iPadPadding: 40)
            }
        }
    }
    
    var navBar: some View {
        Text("Characters")
            .kerning(0.4)
            .frame(maxWidth: .infinity)
            .IMGR_iosDeviceTypeFont(font: .init(name: .comfortaa, style: .medium, iPhoneSize: 28, iPadSize: 56))
            .foregroundColor(.black)
            .IMGR_iosDeviceTypePadding(edge: .top, iOSPadding: 19, iPadPadding: 38)
            .overlay(alignment: .trailing) {
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
    }
    
    var charactersList: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(characters) { character in
                    CardViewCharacter(text: character.name ?? "", imageURL: "/\(character.image ?? "")")
                }
                .background(.white)
                .opacity(0.8)
                .IMGR_cornerRadius_IMGR(isIPad ? 40 : 20, corners: .allCorners)
                .overlay {
                    RoundedRectangle(cornerRadius: isIPad ? 40 : 20)
                        .stroke(.white, lineWidth: isIPad ? 2 : 1)
                }
            }
        }
    }
}

#Preview {
    IMGR_CharactersView()
        .environment(\.managedObjectContext, IMGR_CoreDataStoreMock.preview)
}
