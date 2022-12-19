//
//  PhotoListCoordinator.swift
//  TGATest
//
//  Created by Valentyn Khimchuk on 22.06.2022.
//

import UIKit

class PhotoListCoordinator: Coordinator {
    // MARK: - Dependencies
    var controller: PhotoListViewController
    let presenter: UINavigationController
    private let photoQuery: String
    
    init(presenter: UINavigationController, photoQuery: String, delegate: PhotoListViewControllerDelegate?) {
        self.presenter = presenter
        self.photoQuery = photoQuery
        controller = PhotoListViewController.fromStoryboard
        controller.delegate = delegate
    }
    
    func start() {
        controller.viewModel = viewModel
        presenter.pushViewController(controller, animated: true)
        presenter.setNavigationBarHidden(false, animated: false)
    }
    
    var viewModel: PhotoListViewModel {
        let viewModel = PhotoListViewModel(photoQuery: photoQuery, delegate: controller)
        
        return viewModel
    }
}
