//
//  Place.swift
//  KarrotHome
//
//  Created by 이재은 on 2021/07/21.
//

import Foundation

enum Place: String {
    /// 홍제동
    case Hongje
    /// 수내1동
    case Sunae1
}

extension Place {
    /// 동네 일반 이름
    var name: String {
        switch self {
        case .Hongje:
            return "홍제동"
        case .Sunae1:
            return "수내1동"
        }
    }

    init(_ rawValue: String) {
        self = Place(rawValue: rawValue) ?? .Hongje
    }
}
