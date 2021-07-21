//
//  UIViewController+.swift
//  KarrotHome
//
//  Created by 이재은 on 2021/07/21.
//

import UIKit

extension UIViewController {
    /// 상태바 + 네비게이션 바 높이 
    var topHeight: CGFloat {
        let statusBarHeight = view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0.0
        let navigationBarHeight = self.navigationController?.navigationBar.frame.height ?? 0.0
        return statusBarHeight + navigationBarHeight
    }
}
