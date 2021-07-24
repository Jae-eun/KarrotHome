//
//  String+.swift
//  KarrotHome
//
//  Created by 이재은 on 2021/07/21.
//

import Foundation

extension String {
    /// 지역화된 문자열 반환
    var localized: String {
        let languageCode = UserManager.languageKey
        let localizedString = Bundle.main.path(forResource: languageCode,
                                               ofType: "lproj")
            .flatMap { Bundle(path: $0) }
            .flatMap { $0.localizedString(forKey: self, value: nil, table: nil)}
        return localizedString ?? self
    }
}
