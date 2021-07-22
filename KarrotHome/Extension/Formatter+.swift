//
//  Formatter+.swift
//  KarrotHome
//
//  Created by 이재은 on 2021/07/20.
//

import Foundation

extension Formatter {
    /// 십진법 스타일로 쉼표 구분
    static let withSeparator: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = ","
        formatter.numberStyle = .decimal
        return formatter
    }()
}

extension Numeric {
    /// 가격 형태로 반환 (0원일 경우, "Free")
    var formattedPriceWithSeparator: String {
        if self == 0 {
            return "Free".localized
        } else {
            if let price = Formatter.withSeparator.string(for: self) {
                return "\(price)원"
            } else {
                return "\(self)"
            }
        }
    }
}
