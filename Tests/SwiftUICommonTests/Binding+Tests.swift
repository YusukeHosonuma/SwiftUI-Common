//
//  File.swift
//  
//
//  Created by Yusuke Hosonuma on 2022/05/22.
//

import XCTest
import SwiftUI

final class BindingExtensionTests: XCTestCase {
    func testInverted() throws {
        var flag = false
        
        let binding: Binding<Bool> = .init(get: { flag }, set: { flag = $0 })
        let inverted = binding.inverted()
        
        XCTAssertTrue(inverted.wrappedValue)
        
        inverted.wrappedValue = false
        XCTAssertTrue(flag)
        XCTAssertFalse(inverted.wrappedValue)
    }

    func testIsPresented() throws {
        var value: String? = "Hello"
        
        let binding: Binding<String?> = .init(get: { value }, set: { value = $0 })
        let isPresent = binding.isPresent()
        
        XCTAssertTrue(isPresent.wrappedValue)
        
        isPresent.wrappedValue = true
        XCTAssertEqual("Hello", value)

        isPresent.wrappedValue = false
        XCTAssertNil(value)
        XCTAssertFalse(isPresent.wrappedValue)
    }
}
