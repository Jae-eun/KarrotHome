//
//  LanguageEnumTest.swift
//  KarrotHomeTests
//
//  Created by 이재은 on 2021/07/22.
//

import XCTest
@testable import KarrotHome

class LanguageEnumTest: XCTestCase {

    func test_koreanCode() {
        let code = Language.korean.code
        XCTAssertEqual(code, "ko")
    }

    func test_englishCode() {
        let code = Language.english.code
        XCTAssertEqual(code, "en")
    }

    func test_ukCode() {
        let code = Language.english_uk.code
        XCTAssertEqual(code, "en-GB")
    }

    func test_caCode() {
        let code = Language.english_ca.code
        XCTAssertEqual(code, "en-CA")
    }

    func test_japaneseCode() {
        let code = Language.japanese.code
        XCTAssertEqual(code, "ja")
    }

    func test_koreanName() {
        let name = Language.korean.name
        XCTAssertEqual(name, "Korean".localized)
    }

    func test_englishName() {
        let name = Language.english.name
        XCTAssertEqual(name, "English".localized)
    }

    func test_ukName() {
        let name = Language.english_uk.name
        XCTAssertEqual(name, "English (UK)".localized)
    }

    func test_caName() {
        let name = Language.english_ca.name
        XCTAssertEqual(name, "English (Canada)".localized)
    }

    func test_japaneseName() {
        let name = Language.japanese.name
        XCTAssertEqual(name, "Japanese".localized)
    }
}
