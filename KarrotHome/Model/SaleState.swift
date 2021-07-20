//
//  SaleState.swift
//  KarrotHome
//
//  Created by 이재은 on 2021/07/21.
//

enum SaleState: String, Decodable {
    case sale
    case reserved
    case sold

    var localizedDescription: String {
        switch self {
        case .sale:
            return "Sale".localized()
        case .reserved:
            return "Reserved".localized()
        case  .sold:
            return "Sold".localized()
        }
    }
}
