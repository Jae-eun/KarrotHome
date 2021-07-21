//
//  UIView+.swift
//  KarrotHome
//
//  Created by 이재은 on 2021/07/20.
//

import UIKit

extension UIView {
    /// 그림자 설정
    func setShadow(color: UIColor = .black,
                   opacity: Float = 0.5,
                   offSet: CGSize = CGSize(width: 1, height: 1),
                   radius: CGFloat = 1) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = offSet
        self.layer.shadowRadius = radius
    }

    /// 둥근 모서리 설정
    func setCornerRadius(_ cornerRadius: CGFloat) {
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = true
    }
}
