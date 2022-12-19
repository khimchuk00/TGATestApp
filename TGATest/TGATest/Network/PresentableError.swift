//
//  PresentableError.swift
//  TGATest
//
//  Created by Valentyn Khimchuk on 23.06.2022.
//

import Foundation

protocol PresentableError: Error {
    var localizedTitle: String { get }
    var localizedMessage: String { get }
}
