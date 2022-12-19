//
//  RequestsTests.swift
//  TGATestTests
//
//  Created by Valentyn Khimchuk on 28.06.2022.
//

import XCTest
@testable import TGATest

class RequestTests: XCTestCase {
    func test_asURLRequest_withQueryItems_createsURLRequestCorrectly() throws {
        let url = URL(string: "https://www.google.com")!

        let request = Request(url: url, method: .GET, queryItems: [URLQueryItem(name: "name", value: "value")])

        let urlRequest = request.asURLRequest

        XCTAssertEqual(urlRequest.url?.absoluteString, "https://www.google.com?name=value")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }

    func test_asURLRequest_withoutQueryItems_requestURLIsCorrect() throws {
        let url = URL(string: "https://www.google.com")!

        let request = Request(url: url, method: .GET, queryItems: [])

        let urlRequest = request.asURLRequest

        XCTAssertEqual(urlRequest.url?.absoluteString, "https://www.google.com")
    }
}
