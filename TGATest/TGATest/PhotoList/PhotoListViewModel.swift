//
//  PhotoListViewModel.swift
//  TGATest
//
//  Created by Valentyn Khimchuk on 22.06.2022.
//

import Foundation

protocol PhotoListViewModelDelegate: AnyObject {
    func updateData(dataSource: ImageModel)
    func showError(errorType: APIError)
}

class PhotoListViewModel {
    private var photoQuery: String
    private var getImagesUseCase: GetImagesUseCase
    
    // MARK: - PhotoListViewModelDelegate
    weak var delegate: PhotoListViewModelDelegate?
    
    init(photoQuery: String, delegate: PhotoListViewModelDelegate?, getImagesUseCase: GetImagesUseCase = GetImagesUseCaseImp()) {
        self.photoQuery = photoQuery
        self.delegate = delegate
        self.getImagesUseCase = getImagesUseCase
    }
    
    func getImages() {
        getImagesUseCase.getImages(by: photoQuery) { [weak self] response in
            switch response {
            case .success(let imageData):
                self?.delegate?.updateData(dataSource: imageData)
            case .failure(let error):
                self?.delegate?.showError(errorType: error)
            }
        }
    }
}
