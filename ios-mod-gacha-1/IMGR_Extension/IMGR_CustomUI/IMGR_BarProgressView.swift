//
//  IMGR_BarProgressView.swift
//  ios-mod-gacha-1
//
//  Created by Jack Flirenceon on 14.01.2024.
//

import SwiftUI

struct IMGR_BarProgressStyle: ProgressViewStyle {

    var color: Color = .black
    var bgColor: Color = .white
    var height: Double = isIPad ? 12 : 6
    var cornerRadius: CGFloat = isIPad ? 120 : 60
    var animation: Animation = .easeInOut

    func makeBody(configuration: Configuration) -> some View {
            let fractionCompleted = configuration.fractionCompleted ?? 0

            return VStack {
                ZStack(alignment: .topLeading) {
                    GeometryReader { geo in
                        Rectangle()
                            .fill(color)
                            .frame(maxWidth: geo.size.width * CGFloat(fractionCompleted))
                            .cornerRadius(cornerRadius)
                            .animation(animation, value: fractionCompleted)

                    }
                }
                .frame(height: height)
                .cornerRadius(cornerRadius)
                .background(
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .fill(bgColor)
                )
            }
        }
}
