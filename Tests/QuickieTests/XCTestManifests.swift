import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {

    var tests = [
        testCase(QuickieTests.allTests),
        testCase(URLTests.allTests)
    ]

    #if !canImport(UIKit)
    tests.append([
        testCase(UIColorTests.allTests)
    ])
    #endif

    return tests
}
#endif
