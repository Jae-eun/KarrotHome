//
//  HomeService.swift
//  KarrotHome
//
//  Created by 이재은 on 2021/07/20.
//

import Foundation

protocol HomeServiceType: AnyObject {
    /// 상품 목록 가져오기
    func fetchProductList(_ currentPlaceKey: String) -> [Product]
}

final class HomeService: HomeServiceType {

    // MARK: - Properties
    private let jsonManager: JSONManagerType?
    private var productList: ProductList?
    private var resourceName: String = ""

    init(jsonManager: JSONManagerType = JSONManager()) {
        self.jsonManager = jsonManager
    }

    func fetchProductList(_ currentPlaceKey: String) -> [Product] {
        let currentResourceName = getCurrentResourceName(currentPlaceKey)
        productList = jsonManager?.fetchJSONObject(to: ProductList.self,
                                                   resourceName: currentResourceName).result
        return productList?.products ?? []
    }
}

private extension HomeService {
    /// 현재 사용할 JSON파일명 가져오기
    func getCurrentResourceName(_ currentPlaceKey: String) -> String {
        resourceName = "ProductList\(currentPlaceKey)"
        return resourceName
    }
}
