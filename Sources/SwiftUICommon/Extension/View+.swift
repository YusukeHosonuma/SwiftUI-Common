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

    //
    // MARK: For readability.
    //
    
    func enabled(_ enabled: Bool) -> some View {
        disabled(enabled == false)
    }
    
    //
    // MARK: Add Modifier according to condition.
    //
    
    func extend<Content: View>(@ViewBuilder transform: (Self) -> Content) -> some View {
        transform(self)
    }
    
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
    
    //
    // MARK: Decoration
    //

    func border(_ color: Color, width: CGFloat = 1, edge: Edge.Set) -> some View {
        overlay(
            VStack(spacing: 0) {
                if edge == .all || edge == .vertical || edge == .top {
                    color.frame(height: width)
                }
                Spacer()
                if edge == .all || edge == .vertical || edge == .bottom {
                    color.frame(height: width)
                }
            }
        )
        .overlay(
            HStack(spacing: 0) {
                if edge == .all || edge == .horizontal || edge == .leading {
                    color.frame(width: width)
                }
                Spacer()
                if edge == .all || edge == .horizontal || edge == .trailing {
                    color.frame(width: width)
                }
            }
        )
    }
    
    //
    // MARK: For debug.
    //
    
    func debug(_ handler: () -> Void) -> Self {
        handler()
        return self
    }
}
