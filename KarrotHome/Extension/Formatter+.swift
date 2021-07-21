//
//  Formatter+.swift
//  KarrotHome
//
//  Created by 이재은 on 2021/07/20.
//

import Foundation

extension Formatter {
    static let withSeparator: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = ","
        formatter.numberStyle = .decimal
        return formatter
    }()
}

extension Numeric {
    var formattedPriceWithSeparator: String {
        if self == 0 {
            return "Free".localized
        } else {
            return "\(Formatter.withSeparator.string(for: self) ?? "")원"
        }
    }
}
