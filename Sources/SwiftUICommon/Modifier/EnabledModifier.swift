//
//  File.swift
//
//
//  Created by Yusuke Hosonuma on 2022/03/27.
//

import SwiftUI

public extension View {
    func enabled(_ enabled: Bool) -> some View {
        modifier(EnabledModifier(enabled))
    }
}

public struct EnabledModifier: ViewModifier {
    private let enabled: Bool

    public init(_ enabled: Bool) {
        self.enabled = enabled
    }

    public func body(content: Content) -> some View {
        content.disabled(enabled == false)
    }
}
