//
//  PhotoCellViewModel.swift
//  TGATest
//
//  Created by Valentyn Khimchuk on 22.06.2022.
//

import UIKit

protocol PhotoCellDelegate: AnyObject {
    func updateImage(data: ImageData)
}

protocol PhotoCellProtocol {
    func getImage()
}

class PhotoCellViewModel: PhotoCellProtocol {
    private var imageURL: String
     
    weak var delegate: PhotoCellDelegate?
    
    init(imageURL: String, delegate: PhotoCellDelegate? = nil) {
        self.imageURL = imageURL
        self.delegate = delegate
    }
    
    deinit {
        CacheManager.shared.observers[imageURL] = nil
    }
    
    func getImage() {
        CacheManager.shared.observers[imageURL] = self
        let imageData = CacheManager.shared.getImage(by: imageURL)
        delegate?.updateImage(data: imageData)
    }
}

// MARK: - ImagesObserver
extension PhotoCellViewModel: ImagesObserver {
    func updateImages() {
        let imageData = CacheManager.shared.getImage(by: imageURL)
        delegate?.updateImage(data: imageData)
    }
}
