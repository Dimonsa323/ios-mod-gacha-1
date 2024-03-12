//
//  GamesView.swift
//  ios-mod-gacha-ref-0-1
//
//  Created by Дима Губеня on 03.01.2024.
//

import SwiftUI
import FlowStacks

struct IMGR_ModsView: View {
    @EnvironmentObject var navigator: FlowNavigator<IMGR_MainRoute>
    @State private var searchText = ""
    @State private var isModalShow = false
    
    @FetchRequest<IMGR_ModsCD>(fetchRequest: .IMGR_mods())
    private var mods
    var textCell: String = """
Lorem ipsum dolor sit amet, consectetur adipisci elit...
"""
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        IMGR_ZStackWithBackground {
            VStack(spacing: 0) {
                navBarView
                IMGR_CustomSearchBar_Ext(searchText: $searchText)
                    .IMGR_iosDeviceTypePadding(edge: .top, iOSPadding: 20, iPadPadding: 40)
                
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVGrid(columns: columns) {
                        ForEach(mods) { mod in
                            #warning("TEXT CELL")
                            CardView(text: textCell, imageURL: "/\(mod.image ?? "")")
                        }
                        .IMGR_iosDeviceTypePadding(edge: .horizontal, iOSPadding: 6, iPadPadding: 12)
                        .IMGR_iosDeviceTypePadding(edge: .vertical, iOSPadding: 8, iPadPadding: 16)
                        .background(
                            RoundedRectangle(cornerRadius: isIPad ? 40 : 20)
                                .fill(Color.modsCellBackground)
                                .overlay(
                                    RoundedRectangle(cornerRadius: isIPad ? 40 : 20)
                                        .stroke(Color.borderMods, lineWidth: 1)
                                )
                                .clipShape(RoundedRectangle(cornerRadius: isIPad ? 40 : 20))
                        )
                        
                        .IMGR_iosDeviceTypePadding(edge: .bottom, iOSPadding: 10, iPadPadding: 20)
                    }
                    .IMGR_iosDeviceTypePadding(edge: .all, iOSPadding: 20, iPadPadding: 40)
                }
                .frame(maxWidth: .infinity)
            }
            
            .ignoresSafeArea(edges: .bottom)
        }
    }
}

//MARK: Child Views
private extension IMGR_ModsView {
    
    //MARK: - Mods List View
    
    @ViewBuilder
    
    var navBarView: some View {
        HStack {
            Button {
                navigator.goBack()
            } label: {
                Image(.navBarBack)
                    .resizable()
                    .frame(width: isIPad ? 48 : 24)
                    .frame(height: isIPad ? 48 : 24)
            }
            
            Spacer()
            
            Text("Mods")
                .kerning(1.4)
                .foregroundStyle(.black)
                .IMGR_iosDeviceTypeFont(font: .init(name: .comfortaa, style: .regular, iPhoneSize: 28, iPadSize: 56))
            
            Spacer()
            
            Button {
                isModalShow.toggle()
            } label: {
                Image(.property1Filters)
                    .resizable()
                    .frame(width: isIPad ? 48 : 24)
                    .frame(height: isIPad ? 48 : 24)
                    .IMGR_iosDeviceTypePadding(edge: .trailing, iOSPadding: 20, iPadPadding: 40)
                
            }
        }
        .IMGR_iosDeviceTypePadding(edge: .bottom, iOSPadding: 12, iPadPadding: 24)
        .IMGR_iosDeviceTypePadding(edge: .horizontal, iOSPadding: 20, iPadPadding: 40)
//        .sheet(isPresented: @isModalShow) {
//            
//        }
    }
}

struct CardView: View {
    
    let text: String
    let imageURL: String
    
    var body: some View {
        VStack(alignment: .leading) {
            RemoteImage(url: imageURL, size: .init(width: 0, height: 120), image: .constant(nil), cornerRadius: isIPad ? 28 : 14)
            
            Text("Tittle")
                .kerning(0.8)
                .IMGR_iosDeviceTypePadding(edge: .top, iOSPadding: 12, iPadPadding: 24)
                .IMGR_iosDeviceTypeFont(font: .init(name: .comfortaa, style: .bold, iPhoneSize: 16, iPadSize: 32))
                .foregroundStyle(.secondary1)
            
            Text(text)
                .kerning(0.5)
                .IMGR_iosDeviceTypePadding(edge: .top, iOSPadding: 4, iPadPadding: 8)
                .IMGR_iosDeviceTypeFont(font: .init(name: .comfortaa, style: .medium, iPhoneSize: 10, iPadSize: 20))
                .foregroundStyle(.gray2)
            
            Button {
                //
            } label: {
                Text("Open")
                    .kerning(0.7)
                    .IMGR_iosDeviceTypeFont(font: .init(name: .comfortaa, style: .medium, iPhoneSize: 14, iPadSize: 28))
                    .foregroundStyle(.white)
                
            }
            .IMGR_iosDeviceTypeFrameAspec(iOSWidth: 159, iPadWidth: 318)
            .IMGR_iosDeviceTypePadding(edge: .vertical, iOSPadding: 8, iPadPadding: 16)
            .IMGR_iosDeviceTypeFrame(iOSHeight: 32, iPadHeight: 64)
            .background(.secondary1)
            .IMGR_cornerRadius_IMGR(isIPad ? 24 : 12, corners: .allCorners)
        }
    }
}


#Preview {
    let viewContext = IMGR_CoreDataStoreMock.preview
    let modsCD = IMGR_ModsCD(context: viewContext)
    modsCD.name = "Gacha"
    
    return IMGR_ModsView()
        .environment(\.managedObjectContext, IMGR_CoreDataStoreMock.preview)
}

