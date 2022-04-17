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
        state.configure(webView: webView)

        let request = URLRequest(url: url)
        webView.navigationDelegate = context.coordinator
        webView.load(request)
        return webView
    }
}

public final class WebViewState: ObservableObject {
    public typealias Configure = (WKWebView) -> Void

    @Published public var isFirstLoading = true
    @Published public var isLoading = true
    @Published public var canGoBack = false
    @Published public var canGoForward = false

    fileprivate var webView: WKWebView?
    private let configureWKWebView: Configure?

    public init(_ configureWKWebView: Configure? = nil) {
        self.configureWKWebView = configureWKWebView
    }

    public func goBack() {
        webView?.goBack()
    }

    public func goForward() {
        webView?.goForward()
    }

    fileprivate func configure(webView: WKWebView) {
        configureWKWebView?(webView)
        self.webView = webView
    }

    fileprivate func didStartProvisionalNavigation() {
        isLoading = true
        updateButtons()
    }

    fileprivate func didFinish() {
        isFirstLoading = false
        isLoading = false
        updateButtons()
    }

    private func updateButtons() {
        guard let webView = webView else { return }
        canGoBack = webView.canGoBack
        canGoForward = webView.canGoForward
    }
}

public class WebViewCoordinator: NSObject, WKNavigationDelegate {
    private var state: WebViewState

    init(state: WebViewState) {
        self.state = state
    }

    // MARK: WKNavigationDelegate

    public func webView(_: WKWebView, didStartProvisionalNavigation _: WKNavigation!) {
        state.didStartProvisionalNavigation()
    }

    public func webView(_: WKWebView, didFinish _: WKNavigation!) {
        state.didFinish()
    }

    public func webView(_: WKWebView, didFail _: WKNavigation!, withError _: Error) {
        state.didFinish()
    }
}
