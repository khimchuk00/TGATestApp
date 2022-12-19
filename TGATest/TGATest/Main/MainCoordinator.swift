//
//  MainCoordinator.swift
//  TGATest
//
//  Created by Valentyn Khimchuk on 22.06.2022.
//

import UIKit

class MainCoordinator: Coordinator {
    // MARK: - Dependencies
    var controller: MainViewController
    var presenter: UINavigationController
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
        controller = MainViewController.fromStoryboard
    }
    
    func start() {
        controller.viewModel = viewModel
        controller.modalPresentationStyle = .fullScreen
        presenter.pushViewController(controller, animated: true)
    }
    
    var viewModel: MainViewModel {
        let viewModel = MainViewModel()
        
        viewModel.onPhotoList = { [presenter, controller] photoQuery in
            PhotoListCoordinator(presenter: presenter, photoQuery: photoQuery, delegate: controller).start()
        }
        
        return viewModel
    }
}
