import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(QuickieTests.allTests),
        testCase(URLTests.allTests)
    ]
}
#endif
