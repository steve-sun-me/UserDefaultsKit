//
//  Foo.swift
//  UserDefaultsKit
//
//  Created by Steve Sun on 2023-05-06.
//

import Foundation

struct Foo {
    init(userDefaults: UserDefaultsProtocol = UserDefaults.standard) {
        self.userDefaults = userDefaults
    }

    func add(number: Int, forKey key: String) {
        let storedInt = userDefaults.integer(forKey: key)
        let result = storedInt + number
        userDefaults.set(result, forKey: key)
    }

    func minus(number: Int, forKey key: String) {
        let storedInt = userDefaults.integer(forKey: key)
        let result = storedInt - number
        userDefaults.set(result, forKey: key)
    }

    private let userDefaults: UserDefaultsProtocol
}
