//
//  FooTests.swift
//  UserDefaultsKitTests
//
//  Created by Steve Sun on 2023-05-06.
//

import XCTest
@testable import UserDefaultsKit

final class FooTests: XCTestCase {
    var foo: Foo!

    override func setUp() {
        super.setUp()
        foo = Foo(userDefaults: FakeUserDefaults())
    }

    func testAddNumber() {
        let key = "test_add_number"
        XCTAssertEqual(foo.number(forKey: key), 0)
        foo.add(number: 3, forKey: key)
        XCTAssertEqual(foo.number(forKey: key), 3)
        foo.add(number: 5, forKey: key)
        XCTAssertEqual(foo.number(forKey: key), 8)
    }

    func testMinusNumber() {
        let key = "test_minus_number"
        XCTAssertEqual(foo.number(forKey: key), 0)
        foo.minus(number: 3, forKey: key)
        XCTAssertEqual(foo.number(forKey: key), -3)
        foo.minus(number: 5, forKey: key)
        XCTAssertEqual(foo.number(forKey: key), -8)
    }
}
