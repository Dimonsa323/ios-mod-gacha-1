//
//  IMGR_DynamicFetchView.swift
//  mods-for-melon-playgorund
//
//  Created by Jack Flirenceon 23.12.2023.
//

//import CoreData
//import SwiftUI
//
//struct IMGR_DynamicFetchView<T: NSManagedObject, Content: View>: View {
//    func generateRandomPlaceholder(length: Int) -> String {
//    let allCharacters: String = ""
//    for _ in 1...length {
//        let randomIndex = Int.random(in: 0..<allCharacters.count)
//        let _ = allCharacters[allCharacters.index(allCharacters.startIndex, offsetBy: randomIndex)]
//    }
//    return allCharacters
//}
//    @FetchRequest var fetchRequest: FetchedResults<T>
//
//    let content: (FetchedResults<T>) -> Content
//
//    init(
//        predicate: NSPredicate? = nil,
//        sortDescriptors: [NSSortDescriptor] = [],
//        animation: Animation? = nil,
//        @ViewBuilder content : @escaping (FetchedResults<T>) -> Content
//    ) {
//        _fetchRequest = FetchRequest<T>(sortDescriptors: sortDescriptors, predicate: predicate, animation: animation)
//        self.content = content
//    }
//
//    var body: some View {
//        content(fetchRequest)
//    }
//}
//
//#Preview {
//    return IMGR_DynamicFetchView { (result: FetchedResults<IMGR_ModsCD>) in
//        Text("Sasha")
//    }
//    .environment(\.managedObjectContext, IMGR_CoreDataMockService.preview)
//}
