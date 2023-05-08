//
//  FakeUserDefaults.swift
//  UserDefaultsKit
//
//  Created by Steve Sun on 2023-05-06.
//

import Foundation

@objc
public final class FakeUserDefaults: NSObject, UserDefaultsProtocol {
    @objc public var values: [String: Any]

    @objc(initWithValues:)
    public init(values: [String: Any] = [:]) {
        self.values = values
    }

    public func object(forKey defaultName: String) -> Any? {
        return values[defaultName]
    }

    public func url(forKey defaultName: String) -> URL? {
        return object(forKey: defaultName) as? URL
    }

    public func string(forKey defaultName: String) -> String? {
        return object(forKey: defaultName) as? String
    }

    public func bool(forKey defaultName: String) -> Bool {
        return object(forKey: defaultName) as? Bool ?? false
    }

    public func integer(forKey defaultName: String) -> Int {
        return object(forKey: defaultName) as? Int ?? 0
    }

    public func float(forKey defaultName: String) -> Float {
        return object(forKey: defaultName) as? Float ?? 0
    }

    public func double(forKey defaultName: String) -> Double {
        return object(forKey: defaultName) as? Double ?? 0
    }

    public func set(_ value: Any?, forKey defaultName: String) {
        values[defaultName] = value
    }

    public func set(_ value: Int, forKey defaultName: String) {
        values[defaultName] = value
    }

    public func set(_ value: Float, forKey defaultName: String) {
        values[defaultName] = value
    }

    public func set(_ value: Double, forKey defaultName: String) {
        values[defaultName] = value
    }

    public func set(_ value: Bool, forKey defaultName: String) {
        values[defaultName] = value
    }

    public func set(_ url: URL?, forKey defaultName: String) {
        values[defaultName] = url
    }

    public func removeObject(forKey defaultName: String) {
        values.removeValue(forKey: defaultName)
    }

    public func dictionaryRepresentation() -> [String: Any] {
        return values
    }

    public func register(defaults registrationDictionary: [String: Any]) {
        for (key, value) in registrationDictionary where !values.keys.contains(key) {
            values[key] = value
        }
    }
}
