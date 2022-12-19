//
//  CollectionView+Register.swift
//  TGATest
//
//  Created by Valentyn Khimchuk on 22.06.2022.
//

import UIKit

extension UICollectionView {
    func register<T: UICollectionViewCell>(cellType: T.Type) {
        let identifier = "\(cellType)"
        let nib = UINib(nibName: identifier, bundle: nil)
        register(cellType, forCellWithReuseIdentifier: identifier)
        register(nib, forCellWithReuseIdentifier: identifier)
    }
    
    func cell<T: UICollectionViewCell>(cellType: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: "\(cellType)", for: indexPath) as? T else {
            return T()
        }
        return cell
    }
}
