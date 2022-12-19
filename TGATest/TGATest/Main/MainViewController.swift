//
//  MainViewController.swift
//  TGATest
//
//  Created by Valentyn Khimchuk on 22.06.2022.
//

import UIKit

class MainViewController: UIViewController, AlertPresentableVC {
    // MARK: - Outlets
    @IBOutlet private weak var searchTextField: UITextField!
    
    var viewModel: MainViewModel?
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTextField()
        hideKeyboardWhenTappedAround()
    }
    
    // MARK: - Actions
    @IBAction func searchNowButtonDidTap() {
        if let text = searchTextField.text, !text.isEmpty {
            viewModel?.onPhotoList?(text)
        } else {
            presentAlert(text: "Text is empty", description: "Text can't be empty, please enter a text.")
        }
    }
                            
    // MARK: - Private methods
    private func configureTextField() {
        searchTextField.delegate = self
        searchTextField.returnKeyType = .search
    }
}

// MARK: - PhotoListViewControllerDelegate
extension MainViewController: PhotoListViewControllerDelegate {
    func showError(errorType: APIError) {
        presentAlert(text: errorType.code.localizedTitle, description: errorType.code.localizedDescription)
    }
}

// MARK: - UITextFieldDelegate
extension MainViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchNowButtonDidTap()
        
        return textField.resignFirstResponder()
    }
}

// MARK: - StoryboardController
extension MainViewController: StoryboardController {
    static var storyboard: Storyboard {
        .Main
    }
}
