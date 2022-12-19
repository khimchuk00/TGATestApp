//
//  GetImagesRequest.swift
//  TGATest
//
//  Created by Valentyn Khimchuk on 23.06.2022.
//

import Foundation

final class GetImagesRequest: Request {
    convenience init(imageQuery: String) {
        self.init(url: URL(string: "https://pixabay.com/api/")!,
                  method: .GET,
                  queryItems: [URLQueryItem(name: "key", value: Config.APIKey),
                               URLQueryItem(name: "q", value: imageQuery)])
    }
}
