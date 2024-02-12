//
//  IMGR_BarProgressView.swift
//  ios-mod-gacha-1
//
//  Created by Jack Flirenceon on 14.01.2024.
//

import SwiftUI

struct IMGR_BarProgressStyle: ProgressViewStyle {
    
    var color: Color = .secondary1
    var height: Double = 28.0
    var labelFontStyle: Font = .body
    var verticalPadding: CGFloat = 5.0
    var animation: Animation = .easeInOut
    
    func makeBody(configuration: Configuration) -> some View {
        
        let progress = configuration.fractionCompleted ?? 0.0
        
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                
                configuration.label
                    .font(labelFontStyle)
                
                RoundedRectangle(cornerRadius: isIPad ? 40 : 20)
                    .fill(Color(uiColor: .white))
                    .frame(height: height)
                    .frame(width: geometry.size.width)
                    .overlay(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 20.0)
                            .fill(color)
                            .frame(width: (geometry.size.width - 10) * progress, height: 18.0)
                            .padding(.all, verticalPadding)
                    }
            }
        }
        .frame(height: height)
    }
    
    
    

//    var color: Color = .black
//    var bgColor: Color = .white
//    var height: Double = isIPad ? 12 : 6
//    var cornerRadius: CGFloat = isIPad ? 120 : 60
//    var animation: Animation = .easeInOut
    
//    func makeBody(configuration: Configuration) -> some View {
//            let fractionCompleted = configuration.fractionCompleted ?? 0
//
//            return VStack {
//                ZStack(alignment: .topLeading) {
//                    GeometryReader { geo in
//                        Rectangle()
//                            .fill(color)
//                            .frame(maxWidth: geo.size.width * CGFloat(fractionCompleted))
//                            .cornerRadius(cornerRadius)
//                            .animation(animation, value: fractionCompleted)
//
//                    }
//                }
//                .frame(height: height)
//                .cornerRadius(cornerRadius)
//                .background(
//                    RoundedRectangle(cornerRadius: cornerRadius)
//                        .fill(bgColor)
//                )
//            }
//        }
}
