//
//  ImageData.swift
//  TGATest
//
//  Created by Valentyn Khimchuk on 28.06.2022.
//

import UIKit

class ImageData {
    var mainImage: UIImage?
    var state: ImageState = .notExist
    
    init(mainImage: UIImage?, state: ImageState = .notExist) {
        self.mainImage = mainImage
        self.state = state
    }
}

enum ImageState {
    case exist
    case loading
    case notExist
}
