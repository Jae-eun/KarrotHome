//
//  HomeService.swift
//  KarrotHome
//
//  Created by 이재은 on 2021/07/20.
//

import Foundation

protocol HomeServiceType: AnyObject {
    /// 상품 목록 가져오기
    func fetchProductList() -> [Product]
}

final class HomeService: HomeServiceType {

    // MARK: - Properties
    private let jsonManager: JSONManagerType?
    private var productList: ProductList?

    init(jsonManager: JSONManagerType = JSONManager()) {
        self.jsonManager = jsonManager

    }

    func fetchProductList() -> [Product] {
        let resourceName = getCurrentResourceName()
        productList = jsonManager?.fetchJSONObject(to: ProductList.self,
                                                   resourceName: resourceName).result
        return productList?.products ?? []
    }

    private func getCurrentResourceName() -> String {
        return "ProductList\(UserManager.currentPlaceKey)"
    }
}
