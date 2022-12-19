//
//  PhotoCell.swift
//  TGATest
//
//  Created by Valentyn Khimchuk on 22.06.2022.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    // MARK: - Outlets
    @IBOutlet private weak var photoImageView: UIImageView!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    
    func configure(with model: PhotoCellProtocol) {
        startSpining()
        model.getImage()
    }
    
    // MARK: - Private methods
    private func startSpining() {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
    }
    
    private func stopSpining() {
        activityIndicator.isHidden = true
        activityIndicator.stopAnimating()
    }
}

// MARK: - PhotoCellDelegate
extension PhotoCell: PhotoCellDelegate {
    func updateImage(data: ImageData) {
        DispatchQueue.main.async { [weak self] in
            switch data.state {
            case .exist, .notExist:
                self?.photoImageView.image = data.mainImage
                self?.stopSpining()
            case .loading:
                break
            }
        }
    }
}
