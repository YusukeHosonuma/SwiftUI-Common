//
//  File.swift
//
//
//  Created by Yusuke Hosonuma on 2022/05/11.
//

import SwiftUI

@available(iOS, introduced: 13.0, deprecated: 15.0, message: "Please use official API and remove this API.")
@available(macOS, introduced: 10.15, deprecated: 12.0, message: "Please use official API and remove this API.")
extension Section where Parent == Text, Content: View, Footer == EmptyView {
    public init(_ titleKey: LocalizedStringKey, @ViewBuilder content: () -> Content) {
        self.init(content: content) {
            Text(titleKey)
        }
    }

    public init<S>(_ title: S, @ViewBuilder content: () -> Content) where S: StringProtocol {
        self.init(content: content) {
            Text(title)
        }
    }
}
