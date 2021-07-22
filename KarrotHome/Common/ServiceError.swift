//
//  ServiceError.swift
//  KarrotHome
//
//  Created by 이재은 on 2021/07/20.
//

import Foundation

/// 사용자 정의 에러 타입
enum ServiceError: LocalizedError {
    case invalidPath
    case invalidData
    case failedDecoding
}

extension ServiceError {
    var localizedDescription: String {
        switch self {
        case .invalidPath:
            return "Invalid path.".localized
        case .invalidData:
            return "Invalid data.".localized
        case .failedDecoding:
            return "Data decoding failed.".localized
        }
    }
}
