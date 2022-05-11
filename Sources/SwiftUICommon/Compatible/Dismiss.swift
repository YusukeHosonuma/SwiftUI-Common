//
//  File.swift
//
//
//  Created by Yusuke Hosonuma on 2022/05/11.
//

import SwiftUI

//
// Compatible to `@Environment(\.dismiss)` in iOS 15.
//
@propertyWrapper
public struct Dismiss: DynamicProperty {
    @Environment(\.presentationMode) private var presentationMode

    @available(iOS, introduced: 13.0, deprecated: 15.0, message: "Please use `@Environment(\\.dismiss)` and remove this API.")
    @available(macOS, introduced: 10.15, deprecated: 12.0, message: "Please use `@Environment(\\.dismiss)` and remove this API.")
    public init() {}

    public var wrappedValue: DismissAction {
        DismissAction { presentationMode.wrappedValue.dismiss() }
    }

    public struct DismissAction {
        private var action: () -> Void

        init(_ action: @escaping () -> Void) {
            self.action = action
        }

        public func callAsFunction() {
            action()
        }
    }
}
