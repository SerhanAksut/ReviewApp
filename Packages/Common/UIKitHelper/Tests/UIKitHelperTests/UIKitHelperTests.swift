import XCTest
@testable import UIKitHelper

final class UIKitHelperTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(UIKitHelper().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
