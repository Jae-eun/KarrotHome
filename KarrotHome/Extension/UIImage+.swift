//
//  UIImage+.swift
//  KarrotHome
//
//  Created by 이재은 on 2021/07/20.
//

import UIKit

extension UIImage {
    /// SFSymbol 이름으로 이미지 생성
    convenience init?(symbol: SFSymbol) {
        self.init(systemName: symbol.rawValue)
    }

    /// 이미지 사이즈 변경
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
