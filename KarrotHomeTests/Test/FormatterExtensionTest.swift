//
//  FormatterExtensionTest.swift
//  KarrotHomeTests
//
//  Created by 이재은 on 2021/07/22.
//

import XCTest
@testable import KarrotHome

class FormatterExtensionTest: XCTestCase {

    func test_withSeparator() {
        let num = Formatter.withSeparator.string(from: 1000)
        XCTAssertEqual(num, "1,000")
    }

    func test_formattedWithSeparator() {
        let num = 1000.formattedPriceWithSeparator
        XCTAssertEqual(num, "1,000원")
    }

    func test_formattedWithSeparatorZero() {
        let num = 0.formattedPriceWithSeparator
        XCTAssertEqual(num, "Free".localized)
    }
}
