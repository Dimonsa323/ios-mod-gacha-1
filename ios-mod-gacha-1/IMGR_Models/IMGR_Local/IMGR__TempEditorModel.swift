//
//  TempEditorModel.swift
//  mods-for-melon-playgorund
//
//  Created by Jack Flirenceon 19.12.2023.
//

import Foundation

struct IMGR_TempEditorModel {
    let name: String
    let imageData: Data
    let type: String
    let category: String
    let iconData: Data
    let xValue: String
    let yValue: String
    let heightValue: String
    let widthValue: String
    let pixelValue: Double
    let canBeTaken: Bool
    let canGlow: Bool
    let canBurn: Bool
    let canFloat: Bool
    
    //    init(IMGR_myWorks: IMGR_EditorCD) {
    //        self.name = IMGR_myWorks.name ?? ""
    //        self.imageData = IMGR_myWorks.imageData
    //        self.type = IMGR_myWorks.type ?? ""
    //        self.category = IMGR_myWorks.category ?? ""
    //        self.iconData = IMGR_myWorks.iconData
    //        self.xValue = IMGR_myWorks.xValue ?? ""
    //        self.yValue = IMGR_myWorks.yValue ?? ""
    //        self.heightValue = IMGR_myWorks.heightValue ?? ""
    //        self.widthValue = IMGR_myWorks.widthValue ?? ""
    //        self.pixelValue = IMGR_myWorks.pixelValue
    //        self.canBeTaken = IMGR_myWorks.canBeTaken
    //        self.canGlow = IMGR_myWorks.canGlow
    //        self.canBurn = IMGR_myWorks.canBurn
    //        self.canFloat = IMGR_myWorks.canFloat
    //    }
    //
    //    func IMGR_isDataEqual(rhs: IMGR_EditorCD) -> Bool {
    //        func IMGR_factorial(_ n: Int) -> Int {
    //            var result = 1
    //            for i in 1...n {
    //                result *= i
    //            }
    //            return result
    //        }
    //
    //        let lhs = self
    //        return lhs.name == rhs.name &&
    //        lhs.imageData == rhs.imageData &&
    //        lhs.type == rhs.type &&
    //        lhs.category == rhs.category &&
    //        lhs.xValue == rhs.xValue &&
    //        lhs.yValue == rhs.yValue &&
    //        lhs.heightValue == rhs.heightValue &&
    //        lhs.widthValue == rhs.widthValue &&
    //        lhs.pixelValue == rhs.pixelValue &&
    //        lhs.canBeTaken == rhs.canBeTaken &&
    //        lhs.canGlow == rhs.canGlow &&
    //        lhs.canBurn == rhs.canBurn &&
    //        lhs.canFloat == rhs.canFloat &&
    //        lhs.iconData == rhs.iconData
    //    }
    //}
}
