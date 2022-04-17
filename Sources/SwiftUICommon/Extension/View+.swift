//
//  File.swift
//
//
//  Created by Yusuke Hosonuma on 2022/03/25.
//

import SwiftUI

public extension View {
    #if canImport(AppKit)
    func toggleSidebar() {
        NSApplication.toggleSidebar()
    }
    #endif

    #if canImport(UIKit)
    func hideKeyboard() {
        UIApplication.hideKeyboard()
    }
    #endif

    @ViewBuilder
    func when<Content: View>(_ condition: Bool, @ViewBuilder transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }

    @ViewBuilder
    func whenLet<V, Content: View>(_ optional: V?, @ViewBuilder transform: (Self, V) -> Content) -> some View {
        if let value = optional {
            transform(self, value)
        } else {
            self
        }
    }

    func debug(_ handler: () -> Void) -> Self {
        handler()
        return self
    }
}
