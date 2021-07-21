//
//  UIImage+.swift
//  KarrotHome
//
//  Created by 이재은 on 2021/07/20.
//

import UIKit

extension UIImage {

    convenience init?(symbol: SFSymbol) {
        self.init(systemName: symbol.rawValue)
    }

    func resize(newWidth: CGFloat) -> UIImage {
        let scale = newWidth / self.size.width
        let newHeight = self.size.height * scale
        let size = CGSize(width: newWidth, height: newHeight)
        let render = UIGraphicsImageRenderer(size: size)
        let renderImage = render.image { _ in
            self.draw(in: CGRect(origin: .zero, size: size))
        }
        return renderImage
    }
}
