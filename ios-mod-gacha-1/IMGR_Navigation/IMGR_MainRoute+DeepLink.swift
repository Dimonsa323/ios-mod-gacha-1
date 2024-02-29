//
//  MainRoute_IMGR+DeepLink.swift
//  mods-for-melon-playgorund
//
//  Created by Jack Flirenceon 11.12.2023.
//

import Foundation

enum IMGR_MainRoute: Hashable {
    case tabBar
    case detail(IMGR_ContentType)
    case editor(IMGR_EditorCD)
    case detailModView(IMGR_ModsCD)
}


