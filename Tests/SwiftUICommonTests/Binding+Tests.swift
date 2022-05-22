//
//  File.swift
//  
//
//  Created by Yusuke Hosonuma on 2022/05/22.
//

import XCTest
import SwiftUI
@testable import SwiftUICommon

final class BindingExtensionTests: XCTestCase {
    func testComparable() throws {
        var flag = false
        
        let binding: Binding<Bool> = .init(get: { flag }, set: { flag = $0 })
        XCTAssertTrue(binding.inverted().wrappedValue)
        
        binding.inverted().wrappedValue = false
        XCTAssertTrue(flag)
    }
}
