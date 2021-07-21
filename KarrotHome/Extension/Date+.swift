//
//  Date+.swift
//  KarrotHome
//
//  Created by 이재은 on 2021/07/21.
//

import Foundation

extension Date {

    func relativeDate() -> String {
        let formatter = RelativeDateTimeFormatter()
        formatter.dateTimeStyle = .named
        formatter.locale = Locale(identifier: "ko_KR")
        let relativeDate = formatter.localizedString(for: self, relativeTo: Date())
        return relativeDate
    }
}
