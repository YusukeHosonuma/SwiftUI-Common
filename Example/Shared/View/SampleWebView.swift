//
//  SampleWebView.swift
//  Example
//
//  Created by Yusuke Hosonuma on 2022/04/05.
//

import SwiftUI
import SwiftUICommon

private let url = URL(string: "https://github.com/YusukeHosonuma/Swift-Evolution-Browser")!

struct SampleWebView: View {
    @StateObject var webViewState = WebViewState { _ in
        // 💡 If you want to more configuration
        // webView.allowsBackForwardNavigationGestures = true
    }

    var body: some View {
        ZStack {
            WebView(url: url, state: webViewState)

            if webViewState.isFirstLoading {
                ProgressView()
            }
            // 💡 Note: If you want to display an indicator at each page transition.
            //
            // if webViewState.isLoading {
            //     ProgressView()
            // }
        }
        .toolbar {
            ToolbarItemGroup(placement: toolbarPlacement) {
                Spacer()
                Button {
                    webViewState.goBack()
                } label: {
                    Image(systemName: "chevron.backward")
                }
                .enabled(webViewState.canGoBack)

                Button {
                    webViewState.goForward()
                } label: {
                    Image(systemName: "chevron.forward")
                }
                .enabled(webViewState.canGoForward)
            }
        }
    }

    var toolbarPlacement: ToolbarItemPlacement {
        #if os(macOS)
            .automatic
        #else
            .bottomBar
        #endif
    }
}
