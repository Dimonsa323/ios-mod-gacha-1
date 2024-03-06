//
//  HomeView.swift
//  ios-mod-gacha-ref-0-1
//
//  Created by Дима Губеня on 29.12.2023.
//

import SwiftUI
import Resolver
import FlowStacks

struct IMGR_HomeView: View {
    @EnvironmentObject var navigator: FlowNavigator<IMGR_MainRoute>
    @Injected private var apiManager: IMGR_HomeDataAPI
    @Injected private var networkManager: IMGR_NetworkMonitoringManager
    @Injected private var coreData: IMGR_CoreDataStore
    @InjectedObject private var navigationStore: IMGR_MainNavigationStore
    
    @State private var searchText = ""
    @FetchRequest<IMGR_ModsCD>(fetchRequest: .IMGR_mods())
    private var mods
    
    @FetchRequest<IMGR_OutfitIdeaCD>(fetchRequest: .IMGR_outfitIdea())
    private var outfitIdea
    
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
                    navigator.push(.detailModsView)
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
                ForEach(mods) { mod in
                    VStack(alignment: .leading) {
                        RemoteImage(url: "/\(mod.image ?? "")", size: .init(width: 0, height: 159), image: .constant(nil), cornerRadius: isIPad ? 32 : 16)
                            .IMGR_iosDeviceTypePadding(edge: .all, iOSPadding: 12, iPadPadding: 24)
                        Text(mod.name ?? "")
                            .kerning(1)
                            .IMGR_iosDeviceTypeFont(font: .init(name: .comfortaa, style: .bold, iPhoneSize: 20, iPadSize: 40))
                            .IMGR_iosDeviceTypePadding(edge: [.bottom, .leading], iOSPadding: 12, iPadPadding: 24)
                    }
                    .background(.modsCellBackground)
                    .IMGR_cornerRadius_IMGR(isIPad ? 32 : 16, corners: .allCorners)
                    .IMGR_iosDeviceTypePadding(edge: .trailing, iOSPadding: 4, iPadPadding: 8)
                    .onTapGesture {
                        navigator.push(.detailModView(mod))
                    }
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
                    ForEach(outfitIdea) { outfit in
                        RemoteImage(url: "/\(outfit.image ?? "")", size: .init(width: 0, height: 171), image: .constant(nil), cornerRadius: isIPad ? 40 : 20)
//                            .IMGR_cornerRadius_IMGR(20, corners: .allCorners)
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
        .environment(\.managedObjectContext, IMGR_CoreDataStoreMock.preview)
}
