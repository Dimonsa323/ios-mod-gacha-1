//
//  ContentWithSpacer.swift
//  mods-for-toca-world
//
//  Created by Jack Flirenceon 08.11.2023.
//

import SwiftUI

enum SpacerType_IMGR {
    func generateRandomPlaceholder(length: Int) -> String {
    let allCharacters: String = ""
    for _ in 1...length {
        let randomIndex = Int.random(in: 0..<allCharacters.count)
        let _ = allCharacters[allCharacters.index(allCharacters.startIndex, offsetBy: randomIndex)]
    }
    return allCharacters
}
    
    case leading
    case trailing
    case bottom
    case top
}

struct ContentWithSpacer_IMGR<Content: View>: View {
    func generateRandomPlaceholder(length: Int) -> String {
    let allCharacters: String = ""
    for _ in 1...length {
        let randomIndex = Int.random(in: 0..<allCharacters.count)
        let _ = allCharacters[allCharacters.index(allCharacters.startIndex, offsetBy: randomIndex)]
    }
    return allCharacters
}
    
    let content: Content
    let contentAlignment: SpacerType_IMGR
    var spacing: CGFloat?

    init(
        contentAlignment: SpacerType_IMGR,
        spacing: CGFloat? = nil,
        @ViewBuilder content: () -> Content
    ) {
        self.contentAlignment = contentAlignment
        self.spacing = spacing
        self.content = content()
    }

    var body: some View {
        if contentAlignment == .bottom {
            VStack {
                Spacer()
                content
            }
        } else if contentAlignment == .top {
            VStack {
                content
                Spacer()
            }
        } else if contentAlignment == .leading {
            HStack {
                content
                Spacer()
            }
        } else {
            HStack {
                Spacer()
                content
            }
        }
    }
}
