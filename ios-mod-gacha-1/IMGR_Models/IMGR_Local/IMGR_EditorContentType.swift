//
//  dsad.swift
//  mods-for-melon-playgorund
//
//  Created by Jack Flirenceon 17.12.2023.
//

import Foundation

enum IMGR_EditorContentType: String, CaseIterable, Identifiable {
    var id: Self { self }
    
    case living = "Living Templates"
    case miscTemplate = "Misc Templates"
    case IMGR_MyWorks = "My works"

    static var dropDownMenu: [IMGR_EditorContentType] = [.miscTemplate, .living]
}
