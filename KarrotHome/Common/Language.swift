//
//  Language.swift
//  KarrotHome
//
//  Created by 이재은 on 2021/07/21.
//

import Foundation

enum Language: Equatable, CaseIterable {
    case korean
    case english_uk
    case english_ca
    case english
    case japanese
}

extension Language {

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

    var name: String {
        switch self {
        case .korean:
            return "Korean"
        case .english_uk:
            return "English (UK)"
        case .english_ca:
            return "English (Canada)"
        case .english:
            return "English"
        case .japanese:
            return "Japanese"
        }
    }
}
