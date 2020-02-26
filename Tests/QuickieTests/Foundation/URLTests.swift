//
//  URLTests.swift
//  QuickieTests
//
//  Created by Stefan Herold on 21.02.20.
//  Copyright © 2020 Stefan Herold. All rights reserved.
//

import XCTest
@testable import Quickie

final class URLTests: XCTestCase {

    func testConstructUrlEncodedUrlWithQuery() {

        let expected = "https://test.com/%C3%A4hm?z=12"

        let url = URL.createFrom(scheme: "https",
                                 host: "test.com",
                                 path: "/ähm",
                                 parameters: ["z": "12"])

        XCTAssertEqual(url?.absoluteString, expected)
    }

    static var allTests = [
        ("testConstructUrlEncodedUrlWithQuery", testConstructUrlEncodedUrlWithQuery),
    ]
}
