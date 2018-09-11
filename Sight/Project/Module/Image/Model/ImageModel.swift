//
//  ImageModel.swift
//  Sight
//
//  Created by enot on 06.09.2018.
//  Copyright © 2018 eno0t. All rights reserved.
//

import UIKit

class ImageModel: NSObject, ImageModelProtocol {

    private var images: [Image] = []
//    private var processingImages: [:] = []
    private var networkService: NetworkService
    
    weak var delegate: ImageModelDelegate?

    override init() {
        if let images: [Image] = CoreDataService.getEntities() {
            self.images = images
            self.images.reverse()
        }
        networkService = NetworkService()
    }
    
    func startLoad(url: String) {
        let download = Download()
        download.url = url
        download.delegate = self
        networkService.startDownload(download)
        networkService.delegate = self
    }
    
    func saveImage(_ image: UIImage) {
        let random = Int(arc4random_uniform(30) + 5)
        DispatchQueue.delay(.seconds(random)) {
            let coreImage: Image = CoreDataService.getEntity()
            coreImage.data = UIImagePNGRepresentation(image)
            CoreDataService.saveContext()
        }
    }
}

protocol ImageModelDelegate: class {
    func downloadProgressUpdate(for progress: Float)
    func image(_ image: UIImage)
}

extension ImageModel: NetworkServiceDelegate {
    func image(_ image: UIImage) {
        self.saveImage(image)
        delegate?.image(image)
    }
}

extension ImageModel: DownloadDelegate {
    func downloadProgressUpdate(for progress: Float) {
        delegate?.downloadProgressUpdate(for: progress)
    }
}

extension DispatchQueue {
    static func delay(_ delay: DispatchTimeInterval,
                      closure: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay,
                                      execute: closure)
    }
}
