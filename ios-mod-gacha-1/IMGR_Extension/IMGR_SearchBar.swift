//
//  IMGR_SearchBar.swift
//  ios-mod-gacha-1
//
//  Created by Jack Flirenceon 24.12.2023.
//

import SwiftUI

struct IMGR_SearchBar: View {
    @Namespace private var animated
    @State private var showClearButton: Bool = false

    @Binding var showSearchBar: Bool
    @Binding var searchText: String

    @FocusState.Binding var focusedField: IMGR_FocusField?

    let buttonSize: CGFloat = isIPad ? 100 : 50
    let imageSize: CGFloat = isIPad ? 48: 24

    var body: some View {
        HStack {
            if showSearchBar {
                HStack(spacing: 0) {
                    Button {
                        withAnimation {
                            self.showSearchBar.toggle()
                        }
                    } label: {
                        Image(.iconFavorites)
                            .resizable()
                            .frame(width: imageSize, height: imageSize)
                    }
                    .frame(width: buttonSize, height: buttonSize)
                    .matchedGeometryEffect(id: "searchBar", in: animated)
                    .allowsHitTesting(false)

                    TextField("", text: $searchText, prompt: Text("Search").foregroundColor(.black).font(.IMGR_fontWithName(.concert, style: .bold, size: isIPad ? 40 : 20)))
                    .tint(.black)
                    .focused($focusedField, equals: .search)
                    .foregroundStyle(Color.black)
                    .IMGR_iosDeviceTypeFont(font: .init(name: .concert, style: .bold, iPhoneSize: 20, iPadSize: 40))

                    Button {
                        withAnimation {
                            searchText = ""
                            if focusedField == nil {
                                showSearchBar.toggle()
                            }
                        }
                    } label: {
                        Image(.iconFavorites)
                            .resizable()
                            .frame(width: imageSize, height: imageSize)
                    }
                    .onAppear {
                        searchText = ""
                    }
                }
                .IMGR_iosDeviceTypeFrame(iOSHeight: 50, iPadHeight: 100)
                .IMGR_iosDeviceTypePadding(edge: .trailing, iOSPadding: 13, iPadPadding: 26)
            } else {
                Button {
                    withAnimation {
                        self.showSearchBar.toggle()
                    }
                    Task {
                        await Task.IMGR_sleep(seconds: 0.6)
                        focusedField = .search
                    }
                } label: {
                    Image(.iconFavorites)
                        .resizable()
                        .frame(width: imageSize, height: imageSize)
                }
                .frame(width: buttonSize, height: buttonSize)
                .matchedGeometryEffect(id: "searchBar", in: animated)

            }
        }
        .IMGR_addRoundedModifier(radius: buttonSize / 2)
    }
}
