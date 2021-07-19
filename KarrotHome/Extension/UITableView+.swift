//
//  UITableView+.swift
//  KarrotHome
//
//  Created by 이재은 on 2021/07/19.
//

import UIKit

extension UITableView {

    func registerCell(withType type: UITableViewCell.Type) {
        let idendifier = String(describing: type)
        register(type, forCellReuseIdentifier: idendifier)
    }

    func dequeueCell<T: UITableViewCell>(withType type: UITableViewCell.Type,
                                         for indexPath: IndexPath) -> T? {
        let idendifier = String(describing: type)
        return dequeueReusableCell(withIdentifier: idendifier, for: indexPath) as? T
    }
}

