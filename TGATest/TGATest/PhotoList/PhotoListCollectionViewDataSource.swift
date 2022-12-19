//
//  PhotoListCollectionViewDataSource.swift
//  TGATest
//
//  Created by Valentyn Khimchuk on 22.06.2022.
//

import UIKit

protocol PhotoListCollectionViewDataSource {
    func update(with dataSource: [String])
    func configure(with collectionView: UICollectionView)
}

final class PhotoListCollectionViewDataSourceAdapter: NSObject, PhotoListCollectionViewDataSource {
    // MARK: - Dependencies
    private var dataSource: [String] = []
    
    func update(with dataSource: [String]) {
        self.dataSource = dataSource
    }
    
    func configure(with collectionView: UICollectionView) {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(cellType: PhotoCell.self)
        configureLayout(for: collectionView)
    }
    
    // MARK: - Helpers
    private func configureLayout(for collectionView: UICollectionView) {
        let layout = UICollectionViewFlowLayout()
        
        layout.sectionInset = UIEdgeInsets(top: Theme.Dimensions.marginSmall, left: Theme.Dimensions.marginSmall, bottom: Theme.Dimensions.marginSmall, right: Theme.Dimensions.marginSmall)
        collectionView.collectionViewLayout = layout
    }
}

// MARK: - UICollectionViewDelegate & UICollectionViewDataSource & UICollectionViewDelegateFlowLayout
extension PhotoListCollectionViewDataSourceAdapter: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 4 * Theme.Dimensions.marginSmall) / 3

        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.cell(cellType: PhotoCell.self, for: indexPath)
        cell.configure(with: PhotoCellViewModel(imageURL: dataSource[indexPath.item], delegate: cell))
        return cell
    }
}
