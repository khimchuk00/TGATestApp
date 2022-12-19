//
//  CacheManagerTests.swift
//  TGATestTests
//
//  Created by Valentyn Khimchuk on 28.06.2022.
//

import XCTest
@testable import TGATest

class CacheManagerTests: XCTestCase {
    let query = "testQueryq"
    var viewModel: PhotoCellViewModel? = PhotoCellViewModel(imageURL: "testQueryq")
    
    func test_getDataFromEmptyCache_workedCorrectly() {
        let queryForSearch = "testQuery"
        let imageData = CacheManager.shared.getImage(by: queryForSearch)
        XCTAssertNil(imageData.mainImage)
        XCTAssertEqual(imageData.state, .loading)
    }
    
    func test_observersAdding_workedCorrectly() {
        viewModel?.getImage()
        
        XCTAssertNotNil(CacheManager.shared.observers[query])
    }
    
    func test_observersDeleting_workedCorrectly() {
        viewModel = nil
        
        XCTAssertNil(CacheManager.shared.observers[query])
    }
}
