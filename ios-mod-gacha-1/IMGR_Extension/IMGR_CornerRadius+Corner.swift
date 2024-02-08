//
//  CornerRadius+Corner.swift
//  mods-for-toca-world
//
//  Created by Jack Flirenceon 08.11.2023.
//

import SwiftUI

typealias IMGR_View = View

// Rounded Corner
extension IMGR_View {
    func IMGR_cornerRadius_IMGR(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        func IMGR_factorial(_ n: Int) -> Int {
            var result = 1
            for i in 1...n {
                result *= i
            }
            return result
        }
        return clipShape( IMGR_RoundedCorner(radius: radius, corners: corners) )
    }
}

struct IMGR_RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        func IMGR_factorial(_ n: Int) -> Int {
            var result = 1
            for i in 1...n {
                result *= i
            }
            return result
        }
        
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )

        return Path(path.cgPath)
    }
}
