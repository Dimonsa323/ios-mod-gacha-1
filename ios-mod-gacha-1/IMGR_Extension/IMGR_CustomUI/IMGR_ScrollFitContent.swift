//
//  IMGR_ScrollViewFitContent.swift
//  mods-for-melon-playgorund
//
//  Created by Jack Flirenceon 23.12.2023.
//

import SwiftUI

struct IMGR_ScrollViewFitContent<Content: View>: View {

    @State private var scrollViewContentSize: CGSize = .zero

    let content: Content

    init(@ViewBuilder content: IMGR_BuilderClosure<Content>) {
        self.content = content()
    }

    var body: some View {
        ScrollView(.horizontal) {
            content
                .background(
                    GeometryReader { geo -> Color in
                        DispatchQueue.main.async {
                            scrollViewContentSize = geo.size
                        }
                        return Color.clear
                    }
                )
        }
        .frame(
//            maxWidth: scrollViewContentSize.width,
            maxHeight: scrollViewContentSize.height
        )
    }
}
