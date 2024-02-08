//
//  Font_IMGR+Ext.swift
//  mods-for-melon-playgorund
//
//  Created by Jack Flirenceon 11.12.2023.
//

import SwiftUI

typealias IMGR_UIFont = UIFont

extension IMGR_UIFont {
    enum IMGR_Style: String {
        case bold = "-Bold"
        case medium = "-Medium"
        case regular = "-Regular"
    }
    
    enum IMGR_Name: String {
        case concert = "ConcertOne"
        case comfortaa = "Comfortaa"
    }

    static func IMGR_fontWithName(_ name: IMGR_Name, style: IMGR_Style, size: CGFloat) -> UIFont {
        let compoundName = "\(name.rawValue)\(style.rawValue)"

        return UIFont(name: compoundName, size: size)!
    }
}

typealias IMGR_Font = Font

extension IMGR_Font {
    static func IMGR_fontWithName(_ name: IMGR_UIFont.IMGR_Name, style: IMGR_UIFont.IMGR_Style, size: CGFloat) -> Font {
        let compoundName = "\(name.rawValue)\(style.rawValue)"
        return .custom(compoundName, size: size)
    }
}


struct FontModel_IMGR {
    let name: IMGR_UIFont.IMGR_Name
    let style: IMGR_UIFont.IMGR_Style
    let iPhoneSize: CGFloat
    let iPadSize: CGFloat
}
