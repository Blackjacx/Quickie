//
//  QuickieTests.swift
//  QuickieTests
//
//  Created by Stefan Herold on 21.02.20.
//  Copyright © 2020 Stefan Herold. All rights reserved.
//

import XCTest
@testable import Quickie

final class QuickieTests: XCTestCase {

    func testSortByKeyPath() {

        let items = [Person(firstName: "Stefan", lastName: ""),
                     Person(firstName: "Michael", lastName: ""),
                     Person(firstName: "Andi", lastName: "")
        ]
        let processed = items.sorted(by: \.firstName)

        XCTAssertEqual(processed.map { $0.firstName }, ["Andi", "Michael", "Stefan"])
    }

    func testSequenceUnique() {

        let items = [1, 1, 1, 1, 2, 3, 4, 5, 6, 6, 6, 6, 7]
        let processed = items.unique()

        XCTAssertEqual(processed, [1, 2, 3, 4, 5, 6, 7])
    }

    static var allTests = [
        ("testSortByKeyPath", testSortByKeyPath),
        ("testSequenceUnique", testSequenceUnique),
    ]
}
