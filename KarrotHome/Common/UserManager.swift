//
//  UserManager.swift
//  KarrotHome
//
//  Created by 이재은 on 2021/07/21.
//

import Foundation

@propertyWrapper
struct UserDefault<T> {
    private let key: String
    private let defaultValue: T
    private let storage: UserDefaults

    var wrappedValue: T {
        get { storage.object(forKey: key) as? T ?? self.defaultValue }
        set { storage.set(newValue, forKey: self.key) }
    }

    init(key: String,
         defaultValue: T,
         storage: UserDefaults = .standard) {
        self.key = key
        self.defaultValue = defaultValue
        self.storage = storage
    }
}

final class UserManager {
    @UserDefault(key: "languageKey", defaultValue: "ko")
    /// 현재 설정된 언어 코드
    static var languageKey: String

    @UserDefault(key: "placesKey", defaultValue: [])
    /// 등록한 동네 목록
    static var placesKey: [String]
    
    @UserDefault(key: "currentPlaceKey", defaultValue: "")
    /// 현재 설정한 동네
    static var currentPlaceKey: String
}
