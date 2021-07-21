//
//  Language.swift
//  KarrotHome
//
//  Created by 이재은 on 2021/07/21.
//

import Foundation

enum Language: Equatable, CaseIterable {
    /// 한국어
    case korean
    /// 영어(영국)
    case english_uk
    /// 영어(캐나다)
    case english_ca
    /// 영어
    case english
    /// 일본어
    case japanese
}

extension Language {
    /// 지역화 설정 파일을 불러오거나, Date Format 지역 설정에 사용하는 언어 코드
    var code: String {
        switch self {
        case .korean:
            return "ko"
        case .english_uk:
            return "en-GB"
        case .english_ca:
            return "en-CA"
        case .english:
            return "en"
        case .japanese:
            return "ja"
        }
    }
    /// 언어의 일반 이름
    var name: String {
        switch self {
        case .korean:
            return "Korean".localized
        case .english_uk:
            return "English (UK)".localized
        case .english_ca:
            return "English (Canada)".localized
        case .english:
            return "English".localized
        case .japanese:
            return "Japanese".localized
        }
    }
}
