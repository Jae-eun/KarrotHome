//
//  HomeServiceTest.swift
//  KarrotHomeTests
//
//  Created by 이재은 on 2021/07/22.
//

@testable import KarrotHome
import XCTest
import Foundation

class HomeServiceTest: XCTestCase {

    var homeService: HomeService!
    let mockJSONManager = MockJSONManager()

    override func setUpWithError() throws {
        homeService = HomeService(jsonManager: mockJSONManager)
    }

    func test_fetchProductListHongje() throws {
        let result = homeService.fetchProductList("Hongje")
        XCTAssertEqual(result.count, 1)
        XCTAssertNotNil(result)
    }
}
