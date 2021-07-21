//
//  JSONManager.swift
//  KarrotHome
//
//  Created by 이재은 on 2021/07/20.
//

import Foundation

protocol JSONManagerType: AnyObject {
    typealias DecodingResult<T> = (result: T?, error: ServiceError?)

    /// 주어진 데이터를 특정 타입으로 디코딩
    func fetchJSONObject<T: Decodable>(to type: T.Type,
                            resourceName: String) -> DecodingResult<T>
}

final class JSONManager: JSONManagerType {

    // MARK: - Property
    let jsonDecoder = JSONDecoder()

    // MARK: - Fucntion

    /// json 파싱하여 데이터를 가져옴
    func fetchJSONObject<T: Decodable>(to type: T.Type,
                            resourceName: String) -> DecodingResult<T> {
        guard let path = Bundle.main.path(forResource: resourceName,
                                          ofType: "json")
        else {
            return (nil, ServiceError.invalidPath)
        }

        do {
            guard let data = try String(contentsOfFile: path).data(using: .utf8)
            else {
                return (nil, ServiceError.invalidData)
            }
            jsonDecoder.dateDecodingStrategy = .iso8601
            let response: T = try jsonDecoder.decode(T.self, from: data)
            return (response, nil)
        } catch {
            return (nil, ServiceError.failedDecoding)
        }
    }
}
