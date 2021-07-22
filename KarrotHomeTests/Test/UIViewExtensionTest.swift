//
//  UIViewExtensionTest.swift
//  KarrotHomeTests
//
//  Created by 이재은 on 2021/07/22.
//

import XCTest
@testable import KarrotHome

class UIViewExtensionTest: XCTestCase {

    func test_setShadow() {
        let view = UIView()
        view.setShadow()
        XCTAssertEqual(view.layer.shadowColor, UIColor.black.cgColor)
    }

    func test_setCornerRadius() {
        let view = UIView()
        view.setCornerRadius(3)
        XCTAssertEqual(view.layer.cornerRadius, 3)
    }
}
