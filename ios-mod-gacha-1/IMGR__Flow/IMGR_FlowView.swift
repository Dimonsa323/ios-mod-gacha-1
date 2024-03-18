//
//  IMGR_FlowView.swift
//  ios-mod-gacha-1
//
//  Created by Jack Flirenceon 23.12.2023.
//

import SwiftUI
import Resolver
import FlowStacks

struct IMGR_FlowView: View {
    
    @InjectedObject private var navigationStore: IMGR_MainNavigationStore
    
    //    init() {
    //        UITabBar.appearance().isHidden = false
    //    }
    
    var body: some View { 
        Router($navigationStore.routes) { $screen, _ in
                IMGR_pushContent(with: $screen)
               .hideNavBar(with: true)
        }
    }
    
    var tabBar: some View {
        IMGR_ZStackWithBackground {
            IMGR_CharactersView()
     //       IMGR_TabBarView()
//            TabView(selection: $navigationStore.selectedTab) {
//                ForEach(IMGR_ContentType.tabBar) { type in
//                    switch navigationStore.selectedTab {
//                    case .mods:
//                        IMGR_TabBarView()
//                    case .characters:
//                        IMGR_CharactersView()
//                    case .miniGames:
//                        IMGR_GamesView()
//                    case .settings:
//                        IMGR_SettingsView()
//                    default:
//                        EmptyView()
//                    }
//                }
//              //  .tabViewStyle(.page(indexDisplayMode: .never))
//              //  .disableTabViewSwipe()
//              //  .edgesIgnoringSafeArea(.bottom)
//            }
        }
    }
        
        @ViewBuilder
        func IMGR_pushContent(with path: Binding<IMGR_MainRoute>) -> some View {
            switch path.wrappedValue {
            case .tabBar:
                tabBar
            case let .detail(contentType):
                EmptyView() 
                //    IMGR_GeneralDetailView(item: item, contentType: contentType)
            case .editor(_):
                EmptyView()
                //            IMGR_EditorView(myMod: IMGR_MyWorks)
            case .detailModView(let modCD):
                IMGR_ModView(modCD: modCD)
            case .detailModsView:
                IMGR_ModsView()
            }
        }
    }

extension IMGR_View {
    @ViewBuilder
    func hideNavBar(with isHidden: Bool) -> some View {
        if #available(iOS 16.0, *) {
            self
                .toolbar(.hidden, for: .navigationBar)
        } else {
            self.navigationBarHidden(true)
        }
    }
}

#Preview {
    IMGR_FlowView()
}
