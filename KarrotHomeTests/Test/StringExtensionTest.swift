//
//  StringExtensionTest.swift
//  KarrotHomeTests
//
//  Created by 이재은 on 2021/07/22.
//

import XCTest
@testable import KarrotHome

class StringExtensionTest: XCTestCase {

    func test_localized() {
        let localizedSale = "Sale".localized
        XCTAssertEqual(localizedSale, "Sale")
    }


    func test_localizedFailed() {
        let localizedSaled = "Saled".localized
        XCTAssertEqual(localizedSaled, "Saled")
    }
}
