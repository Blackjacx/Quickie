import XCTest
@testable import Quickie

final class QuickieTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Quickie().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
