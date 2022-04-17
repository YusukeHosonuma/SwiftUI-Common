//
//  File.swift
//
//
//  Created by Yusuke Hosonuma on 2022/04/04.
//

#if canImport(AppKit)
import AppKit
import SwiftUI

public final class WindowController<Content: View> {
    private var windowController: NSWindowController?

    public init(title: String = "", content: Content) {
        let styleMask: NSWindow.StyleMask = [.closable, .miniaturizable, /* .resizable,*/ .titled]
        let window = NSWindow()
        window.styleMask = styleMask
        window.title = title
        window.contentView = NSHostingView(rootView: content)
        window.center()
        windowController = NSWindowController(window: window)
    }

    public func show() {
        windowController?.showWindow(windowController?.window)
    }
}
#endif
