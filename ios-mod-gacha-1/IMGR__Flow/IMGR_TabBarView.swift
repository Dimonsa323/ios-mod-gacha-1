//
//  HomeView.swift
//  ios-mod-gacha-ref-0-1
//
//  Created by Дима Губеня on 29.12.2023.
//

import SwiftUI

struct IMGR_TabBarView: View {
    @State private var selection: IMGR_TabBar = .home
    
    enum IMGR_TabBar {
        case home
        case characters
        case games
        case settings
    }
    
    init() {
        IMGR_TabBarAppearance.shared.setAppearance()
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            
            TabView(selection: $selection) {
                IMGR_HomeView()
                    .tabItem {
                        Label {
                            Text("Home")
                                .kerning(0.6)
                        } icon: {
                            Image(.tabBarHome)
                        }
                    }
                    .tag(IMGR_TabBar.home)
                
//                IMGR_ModView(modCD: <#IMGR_ModsCD#>)
//                    .tabItem {
//                        Label {
//                            Text("Characters")
//                        } icon: {
//                            Image(.tabBarPerson)
//                        }
//                    }
//                    .tag(IMGR_TabBar.characters)
                
                IMGR_ModsView()
                    .tabItem {
                        Label {
                            Text("Games")
                        } icon: {
                            Image(.tabBarGames)
                        }
                    }
                    .tag(IMGR_TabBar.games)
                
                IMGR_SettingsView()
                    .tabItem {
                        Label {
                            Text("Settings")
                        } icon: {
                            Image(.tabBarSetting)
                        }
                    }
                    .tag(IMGR_TabBar.settings)
            }
        }
//        .onAppear() {
//            TabBarAppearance.shared.setAppearance()
//        }
        .tint(.white)
    }
}

#Preview {
    IMGR_TabBarView()
}
