//
//  Image+.swift
//  KarrotHome
//
//  Created by 이재은 on 2021/07/20.
//

import UIKit

extension UIImage {

    convenience init?(symbol: SFSymbol) {
        self.init(systemName: symbol.rawValue)
    }
}
