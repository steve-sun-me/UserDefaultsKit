//
//  UserDefaultsProtocol.swift
//  UserDefaultsKit
//
//  Created by Steve Sun on 2023-05-06.
//

import Foundation

@objc
public protocol UserDefaultsProtocol {
    @objc(objectForKey:)
    func object(forKey defaultName: String) -> Any?

    @objc(URLForKey:)
    func url(forKey defaultName: String) -> URL?

    @objc(stringForKey:)
    func string(forKey defaultName: String) -> String?

    @objc(boolForKey:)
    func bool(forKey defaultName: String) -> Bool

    @objc(integerForKey:)
    func integer(forKey defaultName: String) -> Int

    @objc(floatForKey:)
    func float(forKey defaultName: String) -> Float

    @objc(doubleForKey:)
    func double(forKey defaultName: String) -> Double

    @objc(setObject:forKey:)
    func set(_ value: Any?, forKey defaultName: String)

    @objc(setInteger:forKey:)
    func set(_ value: Int, forKey defaultName: String)

    @objc(setFloat:forKey:)
    func set(_ value: Float, forKey defaultName: String)

    @objc(setDouble:forKey:)
    func set(_ value: Double, forKey defaultName: String)

    @objc(setBool:forKey:)
    func set(_ value: Bool, forKey defaultName: String)

    @objc(setURL:forKey:)
    func set(_ url: URL?, forKey defaultName: String)

    @objc(removeObjectForKey:)
    func removeObject(forKey defaultName: String)

    @objc(dictionaryRepresentation)
    func dictionaryRepresentation() -> [String: Any]
}

extension UserDefaults: UserDefaultsProtocol {}
