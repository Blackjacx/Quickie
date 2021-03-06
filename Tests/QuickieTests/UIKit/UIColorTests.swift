//
//  UIColorTests.swift
//  QuickieTests
//
//  Created by Stefan Herold on 21.02.20.
//  Copyright © 2020 Stefan Herold. All rights reserved.
//

#if canImport(UIKit)
import UIKit

import XCTest
@testable import Quickie

final class UIColorTests: XCTestCase {

    func testConversionFrom32BitHexIntegerToColor() {

        let hex32 = 0xffeeddcc
        let color = UIColor(hex32: hex32)  // hex 32 bit initializer

        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        color.getRed(&r, green: &g, blue: &b, alpha: &a)

        XCTAssertEqual(Int(r * 255), 255)
        XCTAssertEqual(Int(g * 255), 238)
        XCTAssertEqual(Int(b * 255), 221)
        XCTAssertEqual(Int(a * 255), 204)
    }

    func testConversionFrom24BitHexIntegerToColor() {

        let hex24 = 0xffeedd
        let color = UIColor(hex24) // hex 24 bit initializer

        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        color.getRed(&r, green: &g, blue: &b, alpha: &a)

        XCTAssertEqual(Int(r * 255), 255)
        XCTAssertEqual(Int(g * 255), 238)
        XCTAssertEqual(Int(b * 255), 221)
        XCTAssertEqual(Int(a * 255), 255)
    }

    static var allTests = [
        ("testConversionFrom32BitHexIntegerToColor", testConversionFrom32BitHexIntegerToColor),
        ("testConversionFrom24BitHexIntegerToColor", testConversionFrom24BitHexIntegerToColor)
    ]
}
#endif
