//
//  UIImageView+.swift
//  KarrotHome
//
//  Created by 이재은 on 2021/07/21.
//

import Foundation
import UIKit

final class ImageManager {
    static let cache = NSCache<NSString, UIImage>()
    private init() {}
}

extension UIImageView {
    /// url로 이미지 다운로드
    func loadImage(with imgURL: String) -> URLSessionDataTask? {
        let cacheKey: NSString = NSString(string: imgURL)
        if let cachedImage = ImageManager.cache.object(forKey: cacheKey) {
            self.image = cachedImage
            return nil
        }
        guard let url = URL(string: imgURL) else {
            return nil
        }

        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if error != nil || response?.url != url {
                return
            }

            DispatchQueue.main.async {
                if let data = data, let image = UIImage(data: data) {
                    self.image = image.resize(newWidth: self.frame.width)
                    ImageManager.cache.setObject(image, forKey: cacheKey)
                }
            }
        }
        task.resume()
        return task
    }
}
