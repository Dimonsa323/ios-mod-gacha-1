//
//  GeneralContentListView.swift
//  mods-for-melon-playground-42
//
//  Created by Александр Ковалев on 24.12.2023.
//

import SwiftUI
import Resolver
import FlowStacks
import Device

struct IMGR_GeneralContentListView: View {
    
    @Environment(\.IMGR_createSheet) private var IMGR_createSheet
    @EnvironmentObject var navigator: FlowNavigator<IMGR_MainRoute>
    @Injected private var coreDataStore: IMGR_CoreDataStore
    //  @Injected private var saveManager: IMGR_SaverManager
    @Injected private var networkManager: IMGR_NetworkMonitoringManager
    
    @State private var size: CGSize = .init()
    
    var searchText: String = ""
    let contentType: IMGR_ContentType
    var predicate: NSPredicate?
    var sortDescriptors: [NSSortDescriptor] = []
    var isFavourite: Bool = false
    
    let dropDownSelection: IMGR_DropDownSelection
    
    var body: some View {
        VStack {
            //        IMGR_DynamicFetchView(
            //            predicate: predicate,
            //            sortDescriptors: sortDescriptors
            //        ) { (mods: FetchedResults<T>) in
            //            VStack {
            //                if mods.isEmpty {
            //                    VStack(spacing: 0) {
            //                        if !searchText.isEmpty {
            //                            Text("NOT FOUND")
            //                        } else if isFavourite {
            //                            Text("EMPTY")
            //                        }
            //                    }
            //                    .frame(maxHeight: .infinity)
            //                    .foregroundStyle(Color.white)
            //                    .IMGR_iosDeviceTypeFont(font: .init(name: .sfProDisplay, style: .regular, iPhoneSize: 20, iPadSize: 40))
            //                    .multilineTextAlignment(.center)
            //                    .ignoresSafeArea(.keyboard)
            //                } else {
            //                    gridView(data: mods)
            //                }
            //            }
            //        }
            //        .onReceive(saveManager.IMGR_didDownlaod, perform: presentDownloadSuccessPopUp)
            //    }
            
            //    func gridView(data: FetchedResults<T>) -> some View {
            //        return IMGR_CategoryList(data: data, numberOfColumns: gridItemCount, dropDownSelection: dropDownSelection) { item in
            //            IMGR_GeneralCardView(contentType: contentType, item: item) { action in
            //                switch action {
            //                case .favourite:
            //                    didTapToBookmark(item: item)
            //                case .pushDetail:
            //
            //                    navigator.push(.detail(item, contentType))
            //                case .pushEditor(let data):
            //                    let myWork = IMGR_MyWorks(moc: coreDataStore.viewContext, item: item, imageData: data)
            //                    navigator.push(.editor(myWork))
            //                case .download(let rect):
            //                    Task {
            //                        await download(item: item)
            //                        await Task.IMGR_sleep(seconds: 1)
            //                        didTaspToShare(rect: rect, item: item)
            //                    }
            //                case .share(let rect):
            //                    didTaspToShare(rect: rect, item: item)
            //                }
            //            }
            //        }
            //    }
            
            //    private var gridItemCount: Int {
            //        switch contentType {
            //        case .skins, .buildings:
            //            isIPad ? (Device.size() < Size.screen12_9Inch ? 1 : 2) : 1
            //        default:
            //            isIPad ? 2 : 1
            //        }
            //    }
        }
    }
}

// MARK: - Methods
//extension IMGR_GeneralContentListView {
////    func didTapToBookmark(item: IMGR_ParentMO) {
////        if item.isFavourite {
////            IMGR_createSheet?(
////                .init(
////                    type: .removeFavoutire(contentType),
////                    firstAction: { _ in
////                        IMGR_createSheet?(nil)
////                    },
////                    secondAction: { _ in
////                        item.isFavourite.toggle()
////                        coreDataStore.IMGR_saveChanges()
////                        IMGR_createSheet?(nil)
////                    }
////                )
////            )
////        } else {
////            item.isFavourite.toggle()
////            coreDataStore.IMGR_saveChanges()
////        }
////    }
//
////    func download(item: IMGR_ParentMO) async {
////        guard networkManager.IMGR_isReachable() else {
////            return
////        }
////        IMGR_createSheet?(.init(type: .loading, firstAction: { _ in }, secondAction: {_ in }))
////        let path = "\(contentType.folderName)/\(item.downloadPathOrEmpty)"
////        await saveManager.IMGR_downloadDidTap(file: (path, item))
////    }
////
////    func didTaspToShare(rect: CGRect, item: IMGR_ParentMO) {
////        saveManager.IMGR_shareApk(apkFileName: item.apkFileName, rect: rect)
////    }
//
////    func presentDownloadSuccessPopUp(result: Result<IMGR_SaveType, any Error>) {
////        Task {
////            switch result {
////            case .success(let type):
////                switch type {
////                case .file(let item) :
////                    item.isLoadedToPhone = true
////                    coreDataStore.IMGR_saveChanges()
////
////                    IMGR_createSheet?(.init(type: .saved, firstAction: { _ in }, secondAction: { _ in }))
////                    await Task.IMGR_sleep(seconds: 1)
////                    IMGR_createSheet?(nil)
////                default:
////                    break
////                }
////
////            case .failure:
////                break
////            }
////        }
////    }
//}

#Preview {
    return IMGR_GeneralContentListView(searchText: "", contentType: .mods, dropDownSelection: .init())
        .environment(\.managedObjectContext, IMGR_CoreDataStoreMock.preview)
}

