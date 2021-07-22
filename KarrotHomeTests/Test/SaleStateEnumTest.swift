//
//  SaleStateEnumTest.swift
//  KarrotHomeTests
//
//  Created by 이재은 on 2021/07/22.
//

import XCTest
@testable import KarrotHome

class SaleStateEnumTest: XCTestCase {

    func test_saleDescription() {
        let description = SaleState.sale.localizedDescription
        XCTAssertEqual(description, "Sale".localized)
    }

    func test_reservedDescription() {
        let description = SaleState.reserved.localizedDescription
        XCTAssertEqual(description, "Reserved".localized)
    }

    func test_soldDescription() {
        let description = SaleState.sold.localizedDescription
        XCTAssertEqual(description, "Sold".localized)
    }
}
