//
//  CacheManager.swift
//  TGATest
//
//  Created by Valentyn Khimchuk on 25.06.2022.
//

import UIKit

protocol ImagesObserver {
    func updateImages()
}

protocol Cache: AnyObject {
    var observers: ThreadSafeDictionary<String, ImagesObserver> { get set }
    var cache: NSCache<NSString, ImageData> { get set }
    func getImage(by query: String) -> ImageData
}

class CacheManager: Cache {
    static let shared = CacheManager()
    
    private init() {}
    
    var observers = ThreadSafeDictionary<String, ImagesObserver>()
    var cache = NSCache<NSString, ImageData>()
    
    private let queue = DispatchQueue(label: "ImageQueue", qos: .userInitiated, attributes: .concurrent)
    
    func getImage(by query: String) -> ImageData {
        let nsQuery = NSString(string: query)
        
        if cache.object(forKey: nsQuery) == nil || cache.object(forKey: nsQuery)?.state == .notExist {
            loadImage(for: query)
        }
        
        return cache.object(forKey: nsQuery) ?? ImageData(mainImage: nil, state: .notExist)
    }
    
    // MARK: - Private methods
    private func loadImage(for query: String) {
        let nsQuery = NSString(string: query)
        cache.setObject(ImageData(mainImage: nil, state: .loading), forKey: nsQuery)
       
        queue.async {
            var deafultImage = UIImage(named: "default_img")!
            
            if let imageURL = URL(string: query), let mainData = try? Data(contentsOf: imageURL), let mainImage = UIImage(data: mainData) {
                deafultImage = mainImage
            }
            
            let imageData = ImageData(mainImage: deafultImage, state: .exist)
            
            self.cache.setObject(imageData, forKey: nsQuery)
            self.observers[query]?.updateImages()
        }
    }
}
