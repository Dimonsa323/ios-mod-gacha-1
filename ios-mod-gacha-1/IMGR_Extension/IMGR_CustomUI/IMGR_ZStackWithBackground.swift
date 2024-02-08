//
//  ZStackWithBG.swift
//  mods-for-toca-world
//
//  Created by Jack Flirenceon 08.11.2023.
//

import SwiftUI

struct IMGR_ZStackWithBackground<Content: View>: View {
    let alignment: Alignment
    let content: Content

    init(
        alignment: Alignment = .center,
        @ViewBuilder content: IMGR_BuilderClosure<Content>
    ) {
        self.alignment = alignment
        self.content = content()
    }

    var body: some View {
        ZStack {
            Image(.mods)
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            content
        }
    }
}



