//
//  PlaceEnumTest.swift
//  KarrotHomeTests
//
//  Created by 이재은 on 2021/07/22.
//

import XCTest
@testable import KarrotHome

class PlaceEnumTest: XCTestCase {

    func test_placeNameHongje() {
        let placeName = Place.Hongje.name
        XCTAssertEqual(placeName, "홍제동")
    }

    func test_placeNameSunae1() {
        let placeName = Place.Sunae1.name
        XCTAssertEqual(placeName, "수내1동")
    }
}
