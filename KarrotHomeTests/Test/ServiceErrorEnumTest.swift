//
//  ServiceErrorEnumTest.swift
//  KarrotHomeTests
//
//  Created by 이재은 on 2021/07/22.
//

import XCTest
@testable import KarrotHome

class ServiceErrorEnumTest: XCTestCase {

    func test_invalidPath() {
        let serviceError = ServiceError.invalidPath.localizedDescription
        XCTAssertEqual(serviceError, "Invalid path.".localized)
    }

    func test_invalidData() {
        let serviceError = ServiceError.invalidData.localizedDescription
        XCTAssertEqual(serviceError, "Invalid data.".localized)
    }

    func test_failedDecoding() {
        let serviceError = ServiceError.failedDecoding.localizedDescription
        XCTAssertEqual(serviceError, "Data decoding failed.".localized)
    }
}
