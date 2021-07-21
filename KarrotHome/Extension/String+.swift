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
        guard let path = Bundle.main.path(forResource: languageCode, ofType: "lproj")
        else {
            return self
        }
        let bundle = Bundle(path: path)
        return bundle?.localizedString(forKey: self, value: nil, table: nil) ?? self
    }
}
