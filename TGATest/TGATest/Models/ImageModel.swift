//
//  ImageModel.swift
//  TGATest
//
//  Created by Valentyn Khimchuk on 23.06.2022.
//

import UIKit

struct ImageModel: Decodable {
    private struct LargeImageURL: Decodable {
        var largeImageURL: String
    }
    
    enum CodingKeys: String, CodingKey {
        case hits
    }
    
    var imagesUrl: [String] = []
        
    init(from decoder: Decoder) throws {
        let hits = try decoder.container(keyedBy: CodingKeys.self)
        let hitsImages = try hits.decode([LargeImageURL].self, forKey: .hits)
        
        imagesUrl = hitsImages.map { $0.largeImageURL }
    }
}
