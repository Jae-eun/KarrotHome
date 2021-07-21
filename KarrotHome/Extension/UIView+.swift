//
//  UIView+.swift
//  KarrotHome
//
//  Created by 이재은 on 2021/07/20.
//

import UIKit

extension UIView {

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

    func setCornerRadius(_ cornerRadius: CGFloat) {
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = true
    }
}
