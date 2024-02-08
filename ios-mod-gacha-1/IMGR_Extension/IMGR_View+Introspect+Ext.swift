//
//  IMGR_View+Introspect+Ext.swift
//  ios-mod-gacha-1
//
//  Created by Jack Flirenceon 24.12.2023.
//

import SwiftUI
@_spi(Advanced) import SwiftUIIntrospect

// MARK: - Scroll View
extension View {
    func disableBouncingWhenNotScrollable() -> some View {
        introspect(.scrollView, on: .iOS(.v15...)) { scrollView in
            scrollView.alwaysBounceVertical = false
        }
    }
    
    func disableTabViewSwipe() -> some View {
        introspect(.tabView(style: .page), on: .iOS(.v15...)) {
            $0.isScrollEnabled = false
        }
    }
}
