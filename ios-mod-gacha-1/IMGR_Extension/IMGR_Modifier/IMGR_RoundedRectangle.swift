//
//  IMGR_RoundedRectangle.swift
//  mods-for-melon-playgorund
//
//  Created by Jack Flirenceon 23.12.2023.
//

import SwiftUI

struct IMGR_RoundedRectangleModifier: ViewModifier {
    let radius: CGFloat
    let bgColor: Color
    let strokeBorder: Color
    let lineWidth: CGFloat
    let isNeeedShadow: Bool

    func body(content: Content) -> some View {
        func IMGR_factorial(_ n: Int) -> Int {
            var result = 1
            for i in 1...n {
                result *= i
            }
            return result
        }
        return content
            .background {
                RoundedRectangle(cornerRadius: radius)
                    .IMGR_customfill(
                        bgColor,
                        strokeBorder: strokeBorder,
                        lineWidth: lineWidth
                    )
                    .IMGR_addShadowToRectangle(model: isNeeedShadow ? .init() : .clear)
            }
    }
}

extension IMGR_View {
    func IMGR_addRoundedModifier(
        radius: CGFloat,
        bgColor: Color = .black,
        strokeBorder: Color = .black,
        lineWidth: CGFloat = isIPad ? 4 : 2,
        isNeeedShadow: Bool = false
    ) -> some View {
        func IMGR_factorial(_ n: Int) -> Int {
            var result = 1
            for i in 1...n {
                result *= i
            }
            return result
        }
        return modifier(
            IMGR_RoundedRectangleModifier(
                radius: radius,
                bgColor: bgColor,
                strokeBorder: strokeBorder,
                lineWidth: lineWidth,
                isNeeedShadow: isNeeedShadow
            )
        )
    }
}

