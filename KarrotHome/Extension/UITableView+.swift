//
//  UITableView+.swift
//  KarrotHome
//
//  Created by 이재은 on 2021/07/19.
//

import UIKit

extension UITableView {
    /// 새로운 테이블 셀을 만드는 데에 사용할 클래스 등록
    func registerCell(withType type: UITableViewCell.Type) {
        let idendifier = String(describing: type)
        register(type, forCellReuseIdentifier: idendifier)
    }
    /// 지정된 재사용 식별자에 대해 재사용 가능한 테이블뷰셀를 반환하고 테이블에 추가
    func dequeueCell<T: UITableViewCell>(withType type: UITableViewCell.Type,
                                         for indexPath: IndexPath) -> T? {
        let idendifier = String(describing: type)
        return dequeueReusableCell(withIdentifier: idendifier, for: indexPath) as? T
    }
}

