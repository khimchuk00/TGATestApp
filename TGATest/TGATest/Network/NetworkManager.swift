//
//  NetworkManager.swift
//  TGATest
//
//  Created by Valentyn Khimchuk on 23.06.2022.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    private lazy var networking: NetworkingType = Networking(callbackQueue: .main)
    
    private init() {}
    
    func getImages(by query: String, completion: @escaping (Result<ImageModel, APIError>) -> Void) {
        let request = GetImagesRequest(imageQuery: query)
        
        networking.sendRequest(request) { response in
            switch response {
            case .success(let data):
                do {
                    completion(.success(try JSONDecoder().decode(ImageModel.self, from: data)))
                } catch {
                    completion(.failure(APIError(code: .decodingError, request: request)))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
