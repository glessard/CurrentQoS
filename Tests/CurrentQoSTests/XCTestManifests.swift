import XCTest

extension BetterQoSTestCase {
    static let __allTests = [
        ("testQoS", testQoS),
        ("testQoSClass", testQoSClass),
    ]
}

extension CurrentQoSTestCase {
    static let __allTests = [
        ("testCurrent", testCurrent),
    ]
}

#if !os(macOS)
public func __allTests() -> [XCTestCaseEntry] {
    return [
        testCase(BetterQoSTestCase.__allTests),
        testCase(CurrentQoSTestCase.__allTests),
    ]
}
#endif
