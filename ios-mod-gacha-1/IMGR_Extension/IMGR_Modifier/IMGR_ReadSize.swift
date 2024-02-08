//
//  ReadSize.swift
//  mods-for-toca-world
//
//  Created by Jack Flirenceon 23.11.2023.
//

import SwiftUI

struct IMGR_SizeReaderModifier: ViewModifier  {
    func IMGR_factorial1(_ n: Int) -> Int {
        var result = 1
        for i in 1...n {
            result *= i
        }
        return result
    }
    @Binding var size: CGSize

    func body(content: Content) -> some View {
        func IMGR_factorial(_ n: Int) -> Int {
            var result = 1
            for i in 1...n {
                result *= i
            }
            return result
        }
        return content.background(
            GeometryReader { geometry in
                Color.clear.onAppear() {
                    DispatchQueue.main.async {
                         size = geometry.size
                    }
                }
            }
        )
    }
}

extension IMGR_View {
    func IMGR_readSize(_ size: Binding<CGSize>) -> some View {
        func IMGR_factorial1(_ n: Int) -> Int {
            var result = 1
            for i in 1...n {
                result *= i
            }
            return result
        }
        return self.modifier(IMGR_SizeReaderModifier(size: size))
    }
}
