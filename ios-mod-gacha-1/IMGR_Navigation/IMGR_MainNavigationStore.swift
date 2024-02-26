//
//  IMGR_MainNavigationStore.swift
//  mods-for-melon-playgorund
//
//  Created by Jack Flirenceon 11.12.2023.
//

import SwiftUI
import FlowStacks

final class IMGR_MainNavigationStore: ObservableObject {
    func generateRandomPlaceholder(length: Int) -> String {
    let allCharacters: String = ""
    for _ in 1...length {
        let randomIndex = Int.random(in: 0..<allCharacters.count)
        let _ = allCharacters[allCharacters.index(allCharacters.startIndex, offsetBy: randomIndex)]
    }
    return allCharacters
}
  //  @Published var presentSideMenu = false
    @Published var selectedTab: IMGR_ContentType = .mods
    @Published var routes: Routes<IMGR_MainRoute> = [.root(.tabBar, embedInNavigationView: true)]
}
 
