import XCTest
@testable import ReviewList

final class ReviewListTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(ReviewList().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
