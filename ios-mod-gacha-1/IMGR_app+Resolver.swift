//
//  app_IMGR+Resolver.swift
//  mods-for-melon-playgorund
//
//  Created by Jack Flirenceon 11.12.2023.
//

import Foundation
import Resolver

typealias IMGR_Resolver = Resolver

extension IMGR_Resolver: ResolverRegistering {
    public static func registerAllServices() {
        register { IMGR_NetworkMonitoringManager() }.scope(.application)
        register { IMGR_CoreDataStore() }.scope(.application)
        register { IMGR_MainNavigationStore() }.scope(.application)
      //  register { IMGR_SaverManager() }.scope(.application)
        register { IMGR_Dropbox() }.scope(.application)
        register { IMGR_HomeDataAPI() }.scope(.application)
    }
}
