//
//  File.swift
//
//
//  Created by Yusuke Hosonuma on 2022/05/12.
//

import SwiftUI

public extension CGSize {
    /// Alias for `self <= other`
    func contains(_ other: CGSize) -> Bool {
        width <= other.width && height <= other.height
    }
}

extension CGSize: Comparable {
    public static func < (lhs: CGSize, rhs: CGSize) -> Bool {
        lhs.width < rhs.width && lhs.height < rhs.height
    }
}

extension CGSize: AdditiveArithmetic {
    public static func + (lhs: CGSize, rhs: CGSize) -> CGSize {
        .init(
            width: lhs.width + rhs.width,
            height: lhs.height + rhs.height
        )
    }

    public static func - (lhs: CGSize, rhs: CGSize) -> CGSize {
        .init(
            width: lhs.width - rhs.width,
            height: lhs.height - rhs.height
        )
    }
}
