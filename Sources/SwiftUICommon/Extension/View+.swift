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
}
