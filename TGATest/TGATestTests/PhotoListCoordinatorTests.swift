//
//  PhotoListCoordinatorTests.swift
//  TGATestTests
//
//  Created by Valentyn Khimchuk on 28.06.2022.
//

import XCTest
@testable import TGATest

class PhotoListCoordinatorTests: XCTestCase {
    func test_messagesStart_workCorrectly() {
        let sut = PhotoListCoordinator(presenter: UINavigationController(), photoQuery: "TestQuery", delegate: nil)

        sut.start()

        XCTAssert(sut.presenter.visibleViewController is PhotoListViewController)
    }
}
