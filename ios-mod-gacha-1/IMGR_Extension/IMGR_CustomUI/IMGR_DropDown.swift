//
//  IMGR_DropDown.swift
//  mods-for-melon-playgorund
//
//  Created by Jack Flirenceon 23.12.2023.
//

import Foundation
import SwiftUI

// MARK: Custom View Builder
struct IMGR_DropDown: View {

    /// - Drop Down Properties
    let content: [IMGR_DropDownSelection]
    @Binding var selection: IMGR_DropDownSelection
    var dynamic: Bool = true
    var height: CGFloat = isIPad ? 116 : 58
    var prompt: String = ""
    var isNeedScroll: Bool = false

    /// - View Properties
    @State private var expandView: Bool = false
    @State private var disableInteraction: Bool = false

    @State var cornerRadius: CGFloat = isIPad ? 120 : 60
    
    @State private var isBlock: Bool = false

    var body: some View{
        VStack(alignment: .leading, spacing: 0) {
            GeometryReader {
                let size = $0.size

                VStack(alignment: .leading,spacing: 0){
                    if !dynamic {
                        IMGR_RowView(selection, size)
                    }
                    if expandView {
                        if isNeedScroll {
                            ScrollView {
                                listRow(with: size)
                            }
                            .frame(height: expandView ? CGFloat(content.count - 3) * height : height)
                        } else {
                            listRow(with: size)
                        }
                    }
                }
                .background {
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .IMGR_customfill(.black, strokeBorder: .black, lineWidth: isIPad ? 4 : 2)
                }
                /// - Moving View Based on the Selection
                .offset(y: dynamic ? (CGFloat(content.firstIndex(of: selection) ?? 0) * -height) : 0)
            }
            .frame(height: height)
            .mask(alignment: .top){
                RoundedRectangle(cornerRadius: cornerRadius)
                    .frame(height: expandView ? CGFloat(content.count) * height : height)
                /// - Moving the Mask Based on the Selection, so that Every Content Will be Visible
                /// - Visible Only When Content is Expanded
                    .offset(y: dynamic && expandView ? (CGFloat(content.firstIndex(of: selection) ?? 0) * -height) : 0)
            }
            .background {
                if expandView {
                    GeometryReader {
                        let rect = $0.frame(in: .global)
                        Color.primary
                            .opacity(0.001)
                            .onTapGesture {
                                IMGR_closeView(selection)
                            }
                            .offset(x: -rect.minX,y: -rect.minY)
                    }
                    .frame(width: screenSize.width, height: screenSize.height)
                    .position()
                    .ignoresSafeArea()
                }
            }
        }
        .zIndex(selection.zIndex)
        .modifier(IMGR_OptionalClipper(condition: selection.zIndex == 0))
    }

    private func listRow(with size: CGSize) -> some View {
        VStack(spacing: 0) {
            ForEach(content.filter {
                dynamic ? true : $0.id != selection.id
            }) { object in
                IMGR_RowView(object, size)
            }
        }
    }

    /// - Row View
    @ViewBuilder
    func IMGR_RowView(_ object: IMGR_DropDownSelection,_ size: CGSize) -> some View{
        let currentIndex = Double(content.firstIndex(of: object) ?? 0)

        HStack(spacing: 10) {
            if let image = object.image {
                Image(image)
            }
            Text(object.value)
                .IMGR_iosDeviceTypeFont(font: .init(name: .comfortaa, style: .bold, iPhoneSize: 20, iPadSize: 40))
                .foregroundColor(.black)
        }
        .IMGR_iosDeviceTypePadding(edge: .leading, iOSPadding: 24, iPadPadding: 48)
        .frame(width: size.width, height: size.height, alignment: .leading)
        .contentShape(Rectangle())
        .overlay(alignment: .trailing) {
            if object == selection {
                IMGR_CircleButton(image: .iconFavorites) {

                }
                .disabled(true)
                .allowsTightening(false)
                .rotationEffect(/*@START_MENU_TOKEN@*/.zero/*@END_MENU_TOKEN@*/)
                .rotationEffect(.init(degrees: expandView ? -90 : 0))
                .IMGR_iosDeviceTypePadding(edge: .trailing, iOSPadding: 4, iPadPadding: 8)
            }
        }
        .onTapGesture {
            guard !disableInteraction else{return}
            /// - If Expanded then Make Selection
            if expandView{
                IMGR_closeView(object)
            } else {
                IMGR_expandView(object)
            }
            /// - Disabling Interaction While Animating
            disableInteraction = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25){
                disableInteraction = false
            }
        }
        .zIndex(lastSelectionIndex < currentSelectionIndex ? (Double(content.count) - currentIndex) : currentSelectionIndex)
        if content.last != object {
            Divider()
                .overlay {
                    Color.black
                        .frame(height: 1)
                }
                .padding(.leading, 24)
                .padding(.trailing, 61)
        }
    }

    /// - Closes Drop Down View
    func IMGR_closeView(_ object: IMGR_DropDownSelection){
        guard !isBlock else {
            return
        }
        isBlock = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) {
            isBlock = false
        }
        
        withAnimation(.easeInOut.delay(0.4)) {
            cornerRadius = isIPad ? 120 : 60
        }
        withAnimation(.easeInOut(duration: 0.35)){
            expandView = false
            selection.lastSelection = selection.value
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.35){
                selection.zIndex = 0.0
            }
            guard selection.id != object.id else {
                return
            }
            /// - Disabling Animation for Non-Dynamic Contents
            if dynamic{
                selection = object
            }else{
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.35){
                    selection = object
                }
            }
        }
    }

    /// - Expands Drop Down View
    func IMGR_expandView(_ object: IMGR_DropDownSelection){
        guard !isBlock else {
            return
        }
        isBlock = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) {
            isBlock = false
        }
        withAnimation(.easeInOut(duration: 0.1)) {
            cornerRadius = isIPad ? 56 : 28
        }
        withAnimation(.easeInOut(duration: 0.35).delay(1)){
            /// - Disabling Outside Taps
            if selection == object {
                selection.zIndex = 1000.0
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.03){
                    withAnimation(.easeInOut(duration: 0.35)){
                        expandView = true
                    }
                }
            }
        }
    }

    var lastSelectionIndex: Double{
        return Double(content.firstIndex(where: { selection.lastSelection == $0.lastSelection }) ?? 0)
    }

    var currentSelectionIndex: Double{
        return Double(content.firstIndex(of: selection) ?? 0)
    }
}

struct IMGR_DropDownSelection: Hashable, Identifiable {
    let id: UUID = UUID()
    var value: String = ""
    var image: String?
    var lastSelection: String = ""
    var zIndex: Double = 0.0
}

struct IMGR_OptionalClipper: ViewModifier{
    var condition: Bool = false

    func body(content: Content) -> some View {
        if condition{
            content
                .clipped()
                .contentShape(Rectangle())
        } else {
            content
                .transition(.identity)
        }
    }
}

extension IMGR_View {
    var screenSize: CGSize {
        return (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.screen.bounds.size ?? .zero
    }
}
