import XCTest
import SwiftUI
@testable import SwiftUICommon

final class CGSizeExtensionTests: XCTestCase {
    func testComparable() throws {
        XCTAssertTrue(
            CGSize(width: 5, height: 10) < CGSize(width: 10, height: 20),
            "`width` and `height` are less than rhs"
        )

        XCTAssertFalse(
            CGSize(width: 10, height: 20) < CGSize(width: 10, height: 20),
            "`width` and `height` are equal"
        )

        XCTAssertFalse(
            CGSize(width: 10, height: 10) < CGSize(width: 10, height: 20),
            "`width` is equal"
        )

        XCTAssertFalse(
            CGSize(width: 5, height: 20) < CGSize(width: 10, height: 20),
            "`height` is equal"
        )
    }
    
    func testAdditiveArithmetic() throws {
        XCTAssertEqual(
            CGSize(width: 14, height: 28),
            CGSize(width: 10, height: 20) + CGSize(width: 4, height: 8)
        )

        XCTAssertEqual(
            CGSize(width: 6, height: 12),
            CGSize(width: 10, height: 20) - CGSize(width: 4, height: 8)
        )
    }
}
