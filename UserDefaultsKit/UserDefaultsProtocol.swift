//
//  UserDefaultsProtocol.swift
//  UserDefaultsKit
//
//  Created by Steve Sun on 2023-05-06.
//

import Foundation

@objc
public protocol UserDefaultsProtocol {
    func object(forKey defaultName: String) -> Any?
    func string(forKey defaultName: String) -> String?
    func bool(forKey defaultName: String) -> Bool
    func integer(forKey defaultName: String) -> Int
    func float(forKey defaultName: String) -> Float
    func double(forKey defaultName: String) -> Double
    func removeObject(forKey defaultName: String)
    func dictionaryRepresentation() -> [String: Any]

    @objc(setObject:forKey:)
    func set(_ value: Any?, forKey defaultName: String)

    @objc(registerDefaults:)
    func register(defaults registrationDictionary: [String: Any])
}

extension UserDefaults: UserDefaultsProtocol {}
