//
//  FakeUserDefaults.swift
//  UserDefaultsKit
//
//  Created by Steve Sun on 2023-05-06.
//

import Foundation

@objc
public final class FakeUserDefaults: NSObject, UserDefaultsProtocol {
    @objc private var values: [String: Any]

    @objc(initWithValues:)
    public init(values: [String: Any] = [:]) {
        self.values = values
        self.lock = UnsafeMutablePointer<os_unfair_lock_s>.allocate(capacity: 1)
        self.lock.initialize(to: os_unfair_lock())
    }

    deinit {
        lock.deallocate()
    }

    public func object(forKey defaultName: String) -> Any? {
        withLock {
            return values[defaultName]
        }
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
        store(value, forKey: defaultName)
    }

    public func set(_ value: Int, forKey defaultName: String) {
        store(value, forKey: defaultName)
    }

    public func set(_ value: Float, forKey defaultName: String) {
        store(value, forKey: defaultName)
    }

    public func set(_ value: Double, forKey defaultName: String) {
        store(value, forKey: defaultName)
    }

    public func set(_ value: Bool, forKey defaultName: String) {
        store(value, forKey: defaultName)
    }

    public func set(_ url: URL?, forKey defaultName: String) {
        store(url, forKey: defaultName)
    }

    public func removeObject(forKey defaultName: String) {
        withLock {
            self.values.removeValue(forKey: defaultName)
        }
    }

    public func dictionaryRepresentation() -> [String: Any] {
        withLock {
            self.values
        }
    }

    private func store(_ value: Any?, forKey defaultName: String) {
        withLock {
            self.values[defaultName] = value
        }
    }

    @discardableResult
    private func withLock<Value>(_ block: () -> Value) -> Value {
        os_unfair_lock_lock(lock)
        defer {
            os_unfair_lock_unlock(lock)
        }
        return block()
    }

    private var lock: UnsafeMutablePointer<os_unfair_lock_s>
}
