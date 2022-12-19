//
//  Request.swift
//  TGATest
//
//  Created by Valentyn Khimchuk on 23.06.2022.
//

import Foundation

enum Method: String {
    case GET, POST, PUT, DELETE
}

/// Request model
class Request {
    let url: URL
    let method: Method
    let queryItems: [URLQueryItem]

    init(url: URL,
         method: Method,
         queryItems: [URLQueryItem] = []) {
        self.url = url
        self.method = method
        self.queryItems = queryItems
    }
}

// MARK: - Validation
extension Request {
    enum ValidationResult {
        case success
        case error(APIError.Code)
    }
}

// MARK: - URL Request conversion
extension Request {
    /// Convert `Request` instance to `URLRequest`
    var asURLRequest: URLRequest {
        var request = URLRequest(url: url.with(queryItems: queryItems))
        request.httpMethod = method.rawValue
        return request
    }
}
