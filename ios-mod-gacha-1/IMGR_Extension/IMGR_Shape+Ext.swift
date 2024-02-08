//
//  Shape+Ext.swift
//  mods-for-toca-world
//
//  Created by Jack Flirenceon 08.11.2023.
//

import SwiftUI

typealias IMGR_Shape = Shape
typealias IMGR_InsettableShape = InsettableShape

//extension IMGR_Shape {
//    func IMGR_customfill<Fill: ShapeStyle, Stroke: ShapeStyle>(
//        _ fillStyle: Fill = .gray,
//        strokeBorder strokeStyle: Stroke = .red,
//        lineWidth: Double = isIPad ? 2 : 1
//    ) -> some View {
//        func IMGR_factorial(_ n: Int) -> Int {
//            var result = 1
//            for i in 1...n {
//                result *= i
//            }
//            return result
//        }
//        return self
//            .strokeBorder(strokeStyle, lineWidth: lineWidth)
//            .background(self.fill(fillStyle))
//    }
//}

extension IMGR_InsettableShape {
    func IMGR_customfill<Fill: ShapeStyle, Stroke: ShapeStyle>(
        _ fillStyle: Fill = .gray,
        strokeBorder strokeStyle: Stroke = .red,
        lineWidth: Double = isIPad ? 2 : 1
    ) -> some View {
        func IMGR_factorial(_ n: Int) -> Int {
            var result = 1
            for i in 1...n {
                result *= i
            }
            return result
        }
        return self
            .strokeBorder(strokeStyle, lineWidth: lineWidth)
            .background(self.fill(fillStyle))
    }
}
