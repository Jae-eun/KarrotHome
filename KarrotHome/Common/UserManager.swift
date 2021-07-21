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
    static var languageKey: String
}
