//
//  MainCoordinatorTests.swift
//  TGATestTests
//
//  Created by Valentyn Khimchuk on 28.06.2022.
//

import XCTest
@testable import TGATest

class MainCoordinatorTests: XCTestCase {
    func test_messagesStart_workCorrectly() {
        let sut = MainCoordinator(presenter: UINavigationController())

        sut.start()

        XCTAssert(sut.presenter.visibleViewController is MainViewController)
    }
}
