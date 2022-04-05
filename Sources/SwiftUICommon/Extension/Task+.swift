//
//  File.swift
//
//
//  Created by Yusuke Hosonuma on 2022/03/18.
//

import Foundation

public extension Task where Success == Never, Failure == Never {
    static func sleep(seconds: UInt64) async throws {
        try await Task.sleep(nanoseconds: seconds * 1_000_000_000)
    }

    static func sleep(milliseconds: UInt64) async throws {
        try await Task.sleep(nanoseconds: milliseconds * 1_000_000)
    }
}
