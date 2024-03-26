//
//  IMGR_CollectionsView.swift
//  ios-mod-gacha-1
//
//  Created by Дима Губеня on 19.03.2024.
//

import SwiftUI
import FlowStacks

struct IMGR_CollectionsView: View {
    @EnvironmentObject var navigator: FlowNavigator<IMGR_MainRoute>
    @State private var searchText = ""
    @State private var isModalShow = false
    
    @FetchRequest<IMGR_CollectionsCD>(fetchRequest: .IMGR_collections())
    private var collections
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        IMGR_ZStackWithBackground {
            VStack {
                navBarViewCollections
                IMGR_CustomSearchBar_Ext(searchText: $searchText)
                    .IMGR_iosDeviceTypePadding(edge: .top, iOSPadding: 20, iPadPadding: 40)
                collectionsList
                    .IMGR_iosDeviceTypePadding(edge: .all, iOSPadding: 20, iPadPadding: 40)
            }
        }
    }
    
    var collectionsList: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(collections) { collection in
                    CardViewCollections(text: "/\(collection.name ?? "")", imageURL: "/\(collection.image ?? "")")
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

//MARK: Child Views
private extension IMGR_CollectionsView {
    
    var navBarViewCollections: some View {
        Text("Collections")
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
}

#Preview {
    IMGR_CollectionsView()
        .environment(\.managedObjectContext, IMGR_CoreDataStoreMock.preview)
}
