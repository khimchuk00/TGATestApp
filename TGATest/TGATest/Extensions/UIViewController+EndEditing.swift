//
//  UIViewController+EndEditing.swift
//  TGATest
//
//  Created by Valentyn Khimchuk on 28.06.2022.
//

import UIKit

extension UIViewController {
    func hideKeyboardWhenTappedAround(shouldCancelsTouchesInView: Bool = false) {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = shouldCancelsTouchesInView
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
