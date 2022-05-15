//
//  File.swift
//
//
//  Created by Yusuke Hosonuma on 2022/05/15.
//

import SwiftUI

extension View {
    func debug(_ handler: () -> Void) -> Self {
        handler()
        return self
    }

    func print(_ target: Any) -> Self {
        debug {
            Swift.print(target)
        }
    }

    ///
    /// Print `value` when it changed.
    ///
    /// ```
    /// .printOnChange("🍎") { value }
    /// ```
    ///
    func printOnChange<Value: Equatable>(_ label: String = "", value: () -> Value) -> some View {
        onChange(of: value()) {
            Swift.print("\(label)\($0)")
        }
    }
}
