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
        //    IMGR_TabBarView()
            //            IMGR_HomeView()
                IMGR_pushContent(with: $screen)
            //   .hideNavBar(with: true)
        }
    }
    
    var tabBar: some View {
        IMGR_ZStackWithBackground {
            TabView(selection: $navigationStore.selectedTab) {
                ForEach(IMGR_ContentType.tabBar) { type in
                    switch navigationStore.selectedTab {
                    case .mods:
                        IMGR_HomeView()
                    case .characters:
                        EmptyView()
                    case .miniGames:
                        EmptyView()
                    case .settings:
                        IMGR_SettingsView()
                    default:
                        EmptyView()
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .disableTabViewSwipe()
                .edgesIgnoringSafeArea(.bottom)
            }
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
            case .editor(let IMGR_MyWorks):
                EmptyView()
                //            IMGR_EditorView(myMod: IMGR_MyWorks)
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
