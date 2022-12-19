//
//  Networking.swift
//  TGATest
//
//  Created by Valentyn Khimchuk on 23.06.2022.
//

import Foundation

protocol NetworkingType {
    func sendRequest(_ request: Request, completion: @escaping (Result<Data, APIError>) -> Void)
}

final class Networking: NSObject, NetworkingType {
    private let session: URLSession
    private let callbackQueue: DispatchQueue

    init(session: URLSession = .shared, callbackQueue: DispatchQueue) {
        self.session = session
        self.callbackQueue = callbackQueue
    }

    func sendRequest(_ request: Request, completion: @escaping (Result<Data, APIError>) -> Void) {
        let urlRequest = request.asURLRequest

        let task = session.dataTask(with: urlRequest) { [callbackQueue] data, response, error in
            callbackQueue.async {
                if error != nil {
                    completion(.failure(APIError(code: .badRequest, request: request)))
                }
    
                completion(.success(data ?? Data()))
            }
        }

        task.resume()
    }
}
