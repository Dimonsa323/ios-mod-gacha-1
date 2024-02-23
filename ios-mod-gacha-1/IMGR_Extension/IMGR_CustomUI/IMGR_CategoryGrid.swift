//
//  IMGR_CategoryGrid.swift
//  mods-for-melon-playgorund
//
//  Created by Jack Flirenceon 23.12.2023.
//

import SwiftUI
import Resolver

struct IMGR_CategoryList<Content: View, Data: RandomAccessCollection>: View where Data.Element: Hashable, Data.Element: Identifiable {

    @InjectedObject private var navigator: IMGR_MainNavigationStore

    let data: Data
    let content: IMGR_BuilderClosureValue<Data.Element, Content>
    private let dropDownSelection: IMGR_DropDownSelection

    private let iOsColumns: [GridItem]
    private let iPadColumns: [GridItem]
    private let vStackSpacing: CGFloat
    private let isFitHeight: Bool
    private let top: CGFloat
    private let leading: CGFloat
    private let bottom: CGFloat
    private let trailing: CGFloat

    init(
        data: Data,
        gridiPadSpacing: CGFloat = isIPad ? 24 : 14,
        top: CGFloat = isIPad ? 40 : 20,
        leading: CGFloat = 0,
        bottom: CGFloat = isIPad ? 40 : 20,
        trailing: CGFloat = 0,
        vStackSpacing: CGFloat = isIPad ? IMGR_Utilities.shared.IMGR_widthAspectRatioDevice(width: 24) : 14,
        isFitHeight: Bool = false,
        numberOfColumns: Int = isIPad ? 2 : 1,
        dropDownSelection: IMGR_DropDownSelection,
        content: @escaping IMGR_BuilderClosureValue<Data.Element, Content>
    ) {
        self.top = top
        self.leading = leading
        self.bottom = bottom
        self.trailing = trailing
        self.data = data
        self.content = content
        self.vStackSpacing = vStackSpacing
        self.isFitHeight = isFitHeight
        self.dropDownSelection = dropDownSelection

        iOsColumns = (1...numberOfColumns).map { index in
            GridItem(.flexible(), spacing: index == numberOfColumns ? 0 : gridiPadSpacing)
        }

        iPadColumns = (1...numberOfColumns).map { index in
            GridItem(.flexible(), spacing: index == numberOfColumns ? 0 : IMGR_Utilities.shared.IMGR_widthAspectRatioDevice(width: gridiPadSpacing))
        }
    }

    @State private var size: CGSize = .zero

    var body: some View {
        let columns = isIPad ? iPadColumns : iOsColumns
        ScrollViewReader { proxy in
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: columns, spacing: vStackSpacing) {
                    ForEach(data) { number in
                        content(number)
                    }
                }
                .IMGR_iosDeviceTypePadding(
                    edge: .leading,
                    iOSPadding: leading,
                    iPadPadding: leading,
                    iPadIsAspect: true
                )
                .IMGR_iosDeviceTypePadding(
                    edge: .trailing,
                    iOSPadding: trailing,
                    iPadPadding: trailing,
                    iPadIsAspect: true
                )
                .IMGR_iosDeviceTypePadding(
                    edge: .top,
                    iOSPadding: top,
                    iPadPadding: top,
                    iPadIsAspect: false
                )
                .IMGR_iosDeviceTypePadding(
                    edge: .bottom,
                    iOSPadding: bottom,
                    iPadPadding: bottom,
                    iPadIsAspect: false
                )
                .IMGR_readSize($size.animation())
                .id("Static")
            }
//            .onChange(of: navigator.selectedTab) { newValue in
//                proxy.scrollTo("Static", anchor: .top)
//            }
            .onChange(of: dropDownSelection.id) { newValue in
                proxy.scrollTo("Static", anchor: .top)
            }
        }
        .frame(maxHeight: isFitHeight ? size.height : nil)
    }
}

//#Preview {
//    IMGR_HomeView()
//}

