//
//  File.swift
//
//
//  Created by Yusuke Hosonuma on 2022/03/10.
//

import SwiftUI
import WebKit

#if os(macOS)
typealias Representable = NSViewRepresentable
#else
typealias Representable = UIViewRepresentable
#endif

public struct WebView: Representable {
    private let url: URL
    private let state: WebViewState

    public init(url: URL, state: WebViewState) {
        self.url = url
        self.state = state
    }

    public func makeCoordinator() -> WebViewCoordinator {
        .init(state: state)
    }

    // MARK: UIViewRepresentable

    public func makeUIView(context: Context) -> WKWebView {
        makeWKWebView(context: context)
    }

    public func updateUIView(_: WKWebView, context _: Context) {}

    // MARK: UIViewRepresentable

    public func makeNSView(context: Context) -> WKWebView {
        makeWKWebView(context: context)
    }

    public func updateNSView(_: WKWebView, context _: Context) {}

    // MARK: Private

    private func makeWKWebView(context: Context) -> WKWebView {
        let webView = WKWebView()
        state.webView = webView

        let request = URLRequest(url: url)
        webView.navigationDelegate = context.coordinator

        // ☑️ Note:
        // This is not work on NavigationView. (NavigationView swipe-back takes precedence)
        //
        // webView.allowsBackForwardNavigationGestures = true

        webView.load(request)
        return webView
    }
}

public final class WebViewState: ObservableObject {
    @Published public var isLoading = true
    @Published public var canGoBack = false
    @Published public var canGoForward = false

    fileprivate var webView: WKWebView?

    public init() {}

    public func goBack() {
        webView?.goBack()
    }

    public func goForward() {
        webView?.goForward()
    }
}

public class WebViewCoordinator: NSObject, WKNavigationDelegate {
    private var state: WebViewState

    init(state: WebViewState) {
        self.state = state
    }

    // MARK: WKNavigationDelegate

    public func webView(_: WKWebView, didStartProvisionalNavigation _: WKNavigation!) {
        // 💡 Note: not show progress in page navigation.
        // state.isLoading = true
    }

    public func webView(_ webView: WKWebView, didFinish _: WKNavigation!) {
        state.isLoading = false
        state.canGoBack = webView.canGoBack
        state.canGoForward = webView.canGoForward
    }
}
