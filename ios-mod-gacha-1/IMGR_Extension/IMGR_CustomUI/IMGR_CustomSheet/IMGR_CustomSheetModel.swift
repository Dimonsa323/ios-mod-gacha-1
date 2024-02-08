//
//  CustomSheetModel.swift
//  mods-for-toca-world
//
//  Created by Jack Flirenceon 17.11.2023.
//

import Foundation

struct IMGR_CustomSheetModel {
    let type: IMGR_SheetType
    let firstAction: IMGR_ValueClosure<IMGR_CustomSheetAction>
    let secondAction: IMGR_ValueClosure<IMGR_CustomSheetAction>
}

enum IMGR_SheetType {
    case loading
    case saved
    case removeFavoutire(IMGR_ContentType)
    case removeMOds(String)
}

enum IMGR_CustomSheetAction {
    case cancel
    case yes
    case delete
}
