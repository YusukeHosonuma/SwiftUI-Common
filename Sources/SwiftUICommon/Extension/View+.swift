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

    // MARK: - Readability

    func enabled(_ enabled: Bool) -> some View {
        disabled(enabled == false)
    }

    func frame(size: CGSize?) -> some View {
        frame(width: size?.width, height: size?.height)
    }

    // MARK: - Condition

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

    // MARK: - Decoration

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

    // MARK: - Size

    func onChangeSize(perform: @escaping (CGSize) -> Void) -> some View {
        sizePreference()
            .onChangeSizePreference(perform: perform)
    }

    func sizePreference() -> some View {
        background(
            GeometryReader { local in
                Color.clear
                    .preference(key: SizeKey.self, value: local.size)
            }
        )
    }

    func onChangeSizePreference(perform: @escaping (CGSize) -> Void) -> some View {
        onPreferenceChange(SizeKey.self) { size in
            if let size = size {
                perform(size)
            }
        }
    }
}

@available(iOS 15, *)
public extension View {
    // MARK: - Bounds

    func boundsPreference() -> some View {
        anchorPreference(key: BoundsKey.self, value: .bounds) { $0 }
    }

    func onChangeBoundsPreference(_ geometry: GeometryProxy, perform: @escaping (CGSize) -> Void) -> some View {
        onPreferenceChange(BoundsKey.self) { anchor in
            if let anchor = anchor {
                perform(geometry[anchor].size)
            }
        }
    }
}

// MARK: - PreferenceKey

private struct BoundsKey: PreferenceKey {
    static var defaultValue: Anchor<CGRect>?

    static func reduce(value: inout Anchor<CGRect>?, nextValue: () -> Anchor<CGRect>?) {
        value = nextValue()
    }
}

private struct SizeKey: PreferenceKey {
    static var defaultValue: CGSize?

    static func reduce(value: inout CGSize?, nextValue: () -> CGSize?) {
        value = nextValue()
    }
}
