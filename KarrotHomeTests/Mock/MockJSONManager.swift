//
//  MockJSONManager.swift
//  KarrotHomeTests
//
//  Created by 이재은 on 2021/07/22.
//

@testable import KarrotHome
import Foundation

final class MockJSONManager: JSONManagerType {
    var products: [Product] = []

    func fetchJSONObject<T: Decodable>(to type: T.Type,
                            resourceName: String) -> DecodingResult<T> {
        return (MockJSONManager.JSONData as? T, nil)
    }

    static let JSONData: ProductList = KarrotHome.ProductList(totalCount: 1, products: [Product(id: 1, imageUrl: "http://www.k", title: "아이맥", address: "홍제동", postingTime: Date(), isNew: true, state: .sale, price: 1000, commentCount: 1, likeCount: 2)])
}
