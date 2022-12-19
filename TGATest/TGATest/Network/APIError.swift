//
//  APIError.swift
//  TGATest
//
//  Created by Valentyn Khimchuk on 23.06.2022.
//

import Foundation

struct APIError: Swift.Error {
    let code: Code
    let request: Request
    
    enum Code: Swift.Error {
        case badRequest
        case decodingError
    
        var codeDescription: String {
            switch self {
            case .badRequest:
                return "Bad request"
            case .decodingError:
                return "Decoding failed"
            }
        }
    }
}

// MARK: - PresentableError
extension APIError.Code: PresentableError {
    var localizedTitle: String {
        NSLocalizedString(localizationKeys().titleKey, comment: "")
    }

    var localizedMessage: String {
        NSLocalizedString(localizationKeys().messageKey, comment: "")
    }

    func localizationKeys() -> (titleKey: String, messageKey: String) {
        switch self {
        case .badRequest:
            return (titleKey: "Something went wrong", messageKey: "Please try angain later.")
        case .decodingError:
            return (titleKey: "Decoding failed", messageKey: "Something went wrong with data.")
        }
    }
}
