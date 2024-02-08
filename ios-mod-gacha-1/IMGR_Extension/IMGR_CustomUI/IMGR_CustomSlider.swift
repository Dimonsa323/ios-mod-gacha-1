//
//  IMGR_CustomSlider.swift
//  mods-for-melon-playgorund
//
//  Created by Jack Flirenceon 23.12.2023.
//

import SwiftUI

struct IMGR_CustomSlider: View {

    @Binding var sliderValue: Double

    let maxValue: CGFloat
    var height: CGFloat = isIPad ? 24 : 12
    var radius: CGFloat = isIPad ? 24 : 12

    private let totalWidth = UIScreen.main.bounds.width - (isIPad ? 79 : 39)

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading ){
                Rectangle()
                    .fill(Color.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: height)
                    .gesture(
                        DragGesture(minimumDistance: 0)
                            .onChanged( { (value) in

                                // update the width only if its greater than zero and less than the total width
                                if value.location.x <= totalWidth && value.location.x >= 0 {
                                    self.sliderValue = (maxValue * value.location.x) / totalWidth
                                }
                            }))

                Rectangle()
                    .fill(.black)
                    .frame(width: min(CGFloat(sliderValue) / 1000 * geometry.size.width, geometry.size.width), height: height)
                    .gesture(
                        DragGesture(minimumDistance: 0)
                            .onChanged( { (value) in

                                // update the width only if its greater than zero and less than the total width
                                if value.location.x <= totalWidth && value.location.x >= 0 {
                                    self.sliderValue = (maxValue * value.location.x) / totalWidth
                                }
                            }))

            }
            .clipShape(RoundedRectangle(cornerRadius: radius))
            .overlay {
                RoundedRectangle(cornerRadius: radius)
                    .stroke(Color.black, lineWidth: isIPad ? 4 : 2)
            }
        }
        .frame(height: height)
    }
}
