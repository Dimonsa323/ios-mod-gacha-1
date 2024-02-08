//
//  LargeButton.swift
//  mods-for-toca-world
//
//  Created by Jack Flirenceon 09.11.2023.
//

import Foundation

//
//  LargeButton.swift
//  Procrastinee
//
//  Created by Jack Flirenceon 21.08.2023.
//

import SwiftUI

struct IMGR_LargeButton<Content: View>: View {

    @State private var isDisabled: Bool = false

    private let text: String
    private let isLoading: Bool
    private let isValid: Bool
    private let buttonHorizontalMargins: CGFloat
    private let action: IMGR_EmptyClosure?
    private let asyncAction: IMGR_AsyncEmptyClosure?
    private let isNeedBorder: Bool
    private let borderColor: Color
    private let fontStyle: Font
    private let backgroundColor: Color
    private let foregroundColor: Color
    private let cornerRadius: CGFloat
    private let height: CGFloat
    private let lineWidth: CGFloat
    private let alignment: Alignment
    private let textAlignment: Alignment
    private let textPadding: (Edge.Set, CGFloat)
    private let additionalContent: Content

    init(
        text: String,
        isNeedBorder: Bool = true,
        isLoading: Bool = false,
        borderColor: Color = .black,
        isValid: Bool = true,
        buttonHorizontalMargins: CGFloat = 0,
        fontStyle: IMGR_Font = isIPad ? .IMGR_fontWithName(.concert, style: .bold, size: 40) : .IMGR_fontWithName(.concert, style: .bold, size: 20),
        backgroundColor: Color = .black,
        foregroundColor: Color = .black,
        cornerRadius: CGFloat = isIPad ? 90 : 60,
        height: CGFloat = isIPad ? 76 : 58,
        lineWidth: CGFloat = isIPad ? 4 : 2,
        alignment: Alignment = .leading,
        textAlignment: Alignment = .center,
        textPadding: (Edge.Set, CGFloat) = ([], 0),
        action: IMGR_EmptyClosure? = nil,
        asyncAction: IMGR_AsyncEmptyClosure? = nil,
        @ViewBuilder additionalContent: IMGR_BuilderClosure<Content> = { EmptyView() }
    ) {
        self.text = text
        self.isNeedBorder = isNeedBorder
        self.borderColor = borderColor
        self.isValid = isValid
        self.isLoading = isLoading
        self.buttonHorizontalMargins = buttonHorizontalMargins
        self.fontStyle = fontStyle
        self.action = action
        self.asyncAction = asyncAction
        self.cornerRadius = cornerRadius
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.height = height
        self.lineWidth = lineWidth
        self.alignment = alignment
        self.textAlignment = textAlignment
        self.textPadding = textPadding
        self.additionalContent = additionalContent()
    }

    var body: some View {
        HStack {
            Spacer(minLength: buttonHorizontalMargins)
            Button(action: {
                if !action.isNil {
                    action?()
                } else if !asyncAction.isNil {
                    Task {
                        await asyncAction?()
                    }
                }
            }, label: {
                if isLoading {
                    ProgressView()
                        .progressViewStyle(.circular)
                        .tint(.gray)
                } else {
                    ZStack {
                        if !(additionalContent is EmptyView) {
                            HStack {
                                if alignment == .trailing {
                                    Spacer()
                                }
                                additionalContent
                                    .allowsHitTesting(false)
                                if alignment == .leading {
                                    Spacer()
                                }
                            }
                        }
                        Text(text)
                            .frame(height: height)
                            .frame(maxWidth: .infinity, alignment: textAlignment)
                            .padding(textPadding.0, textPadding.1)
                    }
                }
            })
            .buttonStyle(
                IMGR_LargeButtonStyle(
                    isNeedBorder: isNeedBorder,
                    isValid: isValid,
                    fontStyle: fontStyle,
                    cornerRadius: cornerRadius,
                    backgroundColor: backgroundColor,
                    foregroundColor: foregroundColor,
                    borderColor: borderColor,
                    lineWidth: lineWidth
                )
            )
            .disabled(isDisabled)
            .disabled(!isValid)
            Spacer(minLength: buttonHorizontalMargins)
        }
    }
}

struct IMGR_LargeButtonStyle: ButtonStyle {

    let isNeedBorder: Bool
    let isValid: Bool
    let fontStyle: Font
    let cornerRadius: CGFloat
    let backgroundColor: Color
    let foregroundColor: Color
    let borderColor: Color
    let lineWidth: CGFloat

    func makeBody(configuration: Self.Configuration) -> some View {
        let currentForegroundColor = !isValid || configuration.isPressed ?
        foregroundColor.opacity(0.3) :
        foregroundColor

        let currentBorderColor = !isValid ?
        borderColor.opacity(0.3) :
        borderColor

        let backgroundColor = !isValid ? Color.gray.opacity(0.3) : backgroundColor

        return configuration.label
            .foregroundColor(currentForegroundColor)
            .background(backgroundColor)
            .cornerRadius(cornerRadius)
            .overlay(isNeedBorder ? RoundedRectangle(cornerRadius: cornerRadius)
                .strokeBorder(currentBorderColor, lineWidth: lineWidth)
                     : nil)
            .font(fontStyle)
    }
}
