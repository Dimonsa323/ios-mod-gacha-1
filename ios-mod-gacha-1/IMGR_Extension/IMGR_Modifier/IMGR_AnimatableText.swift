//
//  IMGR_AnimatableText.swift
//  ios-mod-gacha-1
//
//  Created by Jack Flirenceon on 14.01.2024.
//

import SwiftUI

struct AnimatableNumberModifier: AnimatableModifier {
    var number: Double
    
    var animatableData: Double {
        get { number }
        set { number = newValue }
    }
    
    func body(content: Content) -> some View {
        content
            .overlay(
                Text("\(Int(number))%")
                    .monospacedDigit()
            )
    }
}

extension View {
    func animatingOverlay(for number: Double) -> some View {
        modifier(AnimatableNumberModifier(number: number))
    }
}
