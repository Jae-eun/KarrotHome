//
//  SaleState.swift
//  KarrotHome
//
//  Created by 이재은 on 2021/07/21.
//

enum SaleState: String, Decodable {
    /// 판매중
    case sale
    /// 예약중
    case reserved
    /// 판매 완료 
    case sold

    var localizedDescription: String {
        switch self {
        case .sale:
            return "Sale".localized
        case .reserved:
            return "Reserved".localized
        case  .sold:
            return "Sold".localized
        }
    }
}
