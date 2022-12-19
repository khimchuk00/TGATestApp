//
//  GetImagesUseCase.swift
//  TGATest
//
//  Created by Valentyn Khimchuk on 23.06.2022.
//

import UIKit

protocol GetImagesUseCase {
    func getImages(by query: String, completion: @escaping (Result<ImageModel, APIError>) -> Void)
}

class GetImagesUseCaseImp: GetImagesUseCase {
    func getImages(by query: String, completion: @escaping (Result<ImageModel, APIError>) -> Void) {
        NetworkManager.shared.getImages(by: query, completion: completion)
    }
}
