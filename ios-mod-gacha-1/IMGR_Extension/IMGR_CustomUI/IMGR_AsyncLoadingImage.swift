//
//  AsyncLoadingImage.swift
//  mods-for-toca-world
//
//  Created by Jack Flirenceon 17.11.2023.
//

import SwiftUI
import Resolver
import HYSLogger

struct RemoteImage: View {
    @StateObject var imageLoader: ImageLoader
    @InjectedObject private var networkManager: IMGR_NetworkMonitoringManager
    @Binding private var image: UIImage?

    private let size: CGSize
    private let localImage: UIImage?

    init(url: String, size: CGSize, image: Binding<UIImage?>, localImage: UIImage? = nil) {
        _imageLoader = .init(wrappedValue: ImageLoader(url: url))
        self.size = size
        self._image = image
        self.localImage = localImage
    }

    var body: some View {
        VStack(spacing: 0) {
            if let image = imageLoader.image {
                Image(uiImage: image)
                    .resizable()
            } else if let localImage {
                Image(uiImage: localImage)
                    .resizable()
            } else {
                ProgressView()
                    .progressViewStyle(.circular)
                    .tint(.gray)
            }
        }
        .onReceive(imageLoader.$image) {
            self.image = $0
        }
        .onChange(of: networkManager.IMGR_isNetworkAvailable) { isOn in
            if imageLoader.image.isNil, isOn {
                if !imageLoader.task.isNil {
                    imageLoader.task?.cancel()
                }
                imageLoader.getImage()
            }
        }
        .aspectRatio(contentMode: .fit)
        .IMGR_iosDeviceTypeFrame(
            iOSHeight: size.height,
            iPadHeight: size.height
        )
    }
}

class ImageLoader: ObservableObject {

    @Injected private var dropBoxManager: IMGR_Dropbox

    @Published var image: UIImage?

    var task: Task<Void, Never>?

    private let url: String

    init(url: String) {
        self.url = url
        
        getImage()
    }
    
    func getImage() {
        guard !url.isEmpty else {
            return
        }
        
        if let cachedImage = dropBoxManager.IMGR_getImageFromCache(forPath: url) {
            self.image = cachedImage
        } else {
            task = Task {
                await getImage(path: url)
            }
        }
    }
    
    private func getImage(path: String?) async {
        guard let path else {
            return
        }
        do {
            let data = try await dropBoxManager.IMGR_downloadData(filePath: path)

             if let image = IMGR_Utilities.shared.IMGR_getImage(data: data) {
                await MainActor.run {
                    self.image = image
                }
                 dropBoxManager.IMGR_writeImageToCash(forPath: path, image: image)
            }
        } catch {
            Logger.error(error)
        }
    }
}
