//
//  ProductList.swift
//  KarrotHome
//
//  Created by 이재은 on 2021/07/20.
//

import Foundation

struct ProductList: Decodable {
    /// 상품 목록 개수
    let totalCount: Int
    let products: [Product]
}

// MARK: - Product
struct Product: Decodable {
    /// 상품 id
    let id: Int
    /// 이미지 URL
    let imageUrl: String
    /// 제목
    let title: String
    /// 주소
    let address: String
    /// 게시 시간
    let postingTime: String
    /// 끌올 여부
    let isNew: Bool
    /// 거래 상태
    let state: String
    /// 가격
    let price: Int
    /// 댓글 개수
    let commentCount: Int?
    /// 좋아요 개수
    let likeCount: Int?
}
