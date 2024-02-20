//
//  IMGR_SplashScreen.swift
//  mods-for-melon-playgorund
//
//  Created by Jack Flirenceon 23.12.2023.
//

import SwiftUI
import Resolver
import HYSLogger
import CoreData

struct IMGR_SplashScreen: View {
    @Injected private var apiManager: IMGR_HomeDataAPI
    @Injected private var networkManager: IMGR_NetworkMonitoringManager
    @Injected private var coreData: IMGR_CoreDataStore
    
    @FetchRequest<IMGR_ModsCD>(fetchRequest: .IMGR_mods())
    private var mods
    
    @State private var downloadedFile: Double = 0
    @Binding var splashScreenIsShow: Bool
    
    var body: some View {
        IMGR_ZStackWithBackground {
            VStack(spacing: isIPad ? 28 : 14 ) {
                Text("Loading...")
                    .foregroundStyle(.secondary1)
                    .IMGR_iosDeviceTypeFont(font: .init(name: .concert, style: .regular, iPhoneSize: 32, iPadSize: 64))
                //                    Spacer()
                //                    Text("100%")
                //                        .monospacedDigit()
                //                        .opacity(0)
                //                        .animatingOverlay(for: Double(Int(downloadedFile) * 100 / IMGR_ContentType.apiMenus.count))
                
                //                .IMGR_iosDeviceTypeFont(font: .init(name: .concert, style: .regular, iPhoneSize: 18, iPadSize: 32))
                
                ProgressView(value: downloadedFile, total: Double(IMGR_ContentType.apiMenus.count))
                    .tint(.secondary1)
                    .progressViewStyle(IMGR_BarProgressStyle(animation: .easeInOut(duration: 1)))
                    .IMGR_iosDeviceTypePadding(edge: .horizontal, iOSPadding: 20, iPadPadding: 40)
                //    .frame(height: 28)
            }
            //            .IMGR_iosDeviceTypePadding(edge: [.horizontal, .top], iOSPadding: 12, iPadPadding: 24)
            //            .IMGR_iosDeviceTypePadding(edge: .bottom, iOSPadding: 8, iPadPadding: 16)
            //            .IMGR_addRoundedModifier(radius: isIPad ? 36 : 18, bgColor: .black)
            //            .IMGR_iosDeviceTypePadding(edge: .horizontal, iOSPadding: 51, iPadPadding: 51)
            //            .frame(maxWidth: 700)
        }
        .task {
            await firstDownloading()
        }
    }
}

private extension IMGR_SplashScreen {
    
    func firstDownloading() async {
        if networkManager.IMGR_isReachable()  {
            await IMGR_downloadingStream()
        } else {
            if mods.isEmpty {
                await IMGR_downloadingStream()
            } else {
                splashScreenIsShow = true
                Logger.debug("All downloaded success")
            }
        }
    }
    
    func IMGR_downloadingStream() async {
        let operations: [IMGR_ContentType] = IMGR_ContentType.apiMenus
        
        await stream(type: operations)
        print("\(operations)")
        
        await Task.IMGR_sleep(seconds: 1)
        Logger.debug("All downloaded success")
        splashScreenIsShow = true
    }
    
    func stream(type: [IMGR_ContentType]) async {
        await withThrowingTaskGroup(of: Void.self) { group in
            for t in type {
                switch t {
                case .mods:
                    group.addTask {
                        await IMGR_Utilities.shared.IMGR_retrowThrowsFunction {
                            try await apiManager.IMGR_getModels(type: .mods)
                            await updateProgress()
                        }
                    }
                case .outfitIdea:
                    group.addTask {
                        await IMGR_Utilities.shared.IMGR_retrowThrowsFunction {
                            try await apiManager.IMGR_getModels(type: .outfitIdea)
                            await updateProgress()
                        }
                    }
                case .collections:
                    group.addTask {
                        await IMGR_Utilities.shared.IMGR_retrowThrowsFunction {
                            try await apiManager.IMGR_getModels(type: .collections)
                            await updateProgress()
                        }
                    }
                case .miniGames:
                    group.addTask {
                        await IMGR_Utilities.shared.IMGR_retrowThrowsFunction {
                            try await apiManager.IMGR_getModels(type: .miniGames)
                            await updateProgress()
                        }
                    }
                case .wallpapers:
                    group.addTask {
                        await IMGR_Utilities.shared.IMGR_retrowThrowsFunction {
                            try await apiManager.IMGR_getModels(type: .wallpapers)
                            await updateProgress()
                        }
                    }
                case .characters:
                    group.addTask {
                        await IMGR_Utilities.shared.IMGR_retrowThrowsFunction {
                            try await apiManager.IMGR_getModels(type: .characters)
                            await updateProgress()
                        }
                    }
                default:
                    break
                }
            }
        }
    }
    
    func updateProgress() {
        withAnimation(.easeInOut(duration: 1)) {
            downloadedFile += 1
        }
    }
}

#Preview {
    IMGR_SplashScreen(splashScreenIsShow: .constant(false))
}
