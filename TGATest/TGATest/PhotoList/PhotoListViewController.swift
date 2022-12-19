//
//  PhotoListViewController.swift
//  TGATest
//
//  Created by Valentyn Khimchuk on 22.06.2022.
//

import UIKit

protocol PhotoListViewControllerDelegate: AnyObject {
    func showError(errorType: APIError)
}


class PhotoListViewController: UIViewController, AlertPresentableVC {
    // MARK: - Outlets
    @IBOutlet private weak var photosCollectionView: UICollectionView!
    
    // MARK: - IdGuardTableViewDataSourceAdapter
    private var collectionViewAdapter: PhotoListCollectionViewDataSource?
    
    // MARK: - PhotoListViewControllerDelegate
    weak var delegate: PhotoListViewControllerDelegate?
    
    // MARK: - PhotoListViewModel
    var viewModel: PhotoListViewModel?
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigationView()
        configureCollectionView()
        viewModel?.getImages()
    }
    
    // MARK: - Private methods
    private func configureNavigationView() {
        title = "Gallery"
    }
    
    private func configureCollectionView() {
        collectionViewAdapter = PhotoListCollectionViewDataSourceAdapter()
        collectionViewAdapter?.configure(with: photosCollectionView)
    }
}

// MARK: - PhotoListViewModelDelegate
extension PhotoListViewController: PhotoListViewModelDelegate {
    func updateData(dataSource: ImageModel) {
        collectionViewAdapter?.update(with: dataSource.imagesUrl)
        photosCollectionView.reloadData()
    }
    
    func showError(errorType: APIError) {
        navigationController?.popViewController(animated: true)
        delegate?.showError(errorType: errorType)
    }
}

// MARK: - StoryboardController
extension PhotoListViewController: StoryboardController {
    static var storyboard: Storyboard {
        .Main
    }
}
