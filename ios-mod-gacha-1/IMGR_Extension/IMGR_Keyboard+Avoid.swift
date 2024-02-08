//
//  IMGR_Keyboard+Avoid.swift
//  ios-mod-gacha-1
//
//  Created by Jack Flirenceon 02.01.2024.
//

import SwiftUI
import Combine

typealias IMGR_Publishers = Publishers

public extension IMGR_Publishers {
    static var keyboardHeight: AnyPublisher<CGFloat, Never> {
        let willShow = NotificationCenter.default.publisher(for: UIApplication.keyboardWillShowNotification)
            .map { $0.keyboardHeight }
        let willHide = NotificationCenter.default.publisher(for: UIApplication.keyboardWillHideNotification)
            .map { _ in CGFloat(0) }

        return MergeMany(willShow, willHide)
            .eraseToAnyPublisher()
    }
}

typealias IMGR_Notification = Notification

public extension IMGR_Notification {
    var keyboardHeight: CGFloat {
        return (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect)?.height ?? 0
    }
}

public struct KeyboardAvoiding: ViewModifier {
    @State private var keyboardActiveAdjustment: CGFloat = 0

    public func body(content: Content) -> some View {
        content
            .safeAreaInset(edge: .bottom, spacing: keyboardActiveAdjustment) {
                EmptyView().frame(height: 0)
            }
            .onReceive(Publishers.keyboardHeight) {
                self.keyboardActiveAdjustment = min($0, 24)
            }
    }
}

public extension IMGR_View {
    func keyboardAvoiding() -> some View {
        modifier(KeyboardAvoiding())
    }
}
