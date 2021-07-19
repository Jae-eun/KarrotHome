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
    layer.masksToBounds = false
    layer.shadowColor = color.cgColor
    layer.shadowOpacity = opacity
    layer.shadowOffset = offSet
    layer.shadowRadius = radius
  }
}
