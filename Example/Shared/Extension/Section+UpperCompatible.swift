//
//  Section+UpperCompatible.swift
//  Example (iOS)
//
//  Created by Yusuke Hosonuma on 2022/04/17.
//

import SwiftUI

@available(iOS, introduced: 13.0, deprecated: 15.0)
@available(macOS, introduced: 10.15, deprecated: 12.0)
extension Section where Parent == Text, Content: View, Footer == EmptyView {
    public init<S>(_ title: S, @ViewBuilder content: () -> Content) where S: StringProtocol {
        self.init(content: content) {
            Text(title)
        }
    }
}
