//
//  ContentView.swift
//  Shared
//
//  Created by Yusuke Hosonuma on 2022/04/05.
//

import SwiftUI
import SwiftUICommon

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                Section("Bridge") {
                    navigationLink("WebView") {
                        SampleWebView()
                    }
                }

                Section("Binding") {
                    navigationLink("Binding<T> to Binding<T?>") {
                        BindingOptionalView()
                    }
                }

                Section("View+") {
                    navigationLink(".enabled(<condition>)") {
                        EnabledView()
                    }
                    navigationLink(".extend { ... }") {
                        Text("Hello")
                            .extend { content in
                                if #available(iOS 15, *) {
                                    // 💡 `dynamicTypeSize` is supports on iOS 15+
                                    content
                                        .environment(\.dynamicTypeSize, .xxxLarge)
                                } else {
                                    content
                                }
                            }
                    }
                    navigationLink(".when(<condition) { ... }") {
                        WhenView()
                    }
                    navigationLink(".whenLet(<optional>) { ... }") {
                        WhenLetView()
                    }
                    navigationLink(".border(.red, width: 1, edge: .top)") {
                        BorderSampleView()
                    }
                }

                Section("Misc") {
                    navigationLink("SliderValue") {
                        SliderView()
                    }
                }

                Section("Debug") {
                    navigationLink(".debug { ... }") {
                        DebugView()
                    }
                }
            }
            .font(.system(size: 12, weight: .regular, design: .monospaced))
            .navigationTitle("Example")
        }
    }

    private func navigationLink<V: View>(_ title: String, content: () -> V) -> some View {
        NavigationLink(title) {
            content()
            #if os(iOS)
                .navigationBarTitleDisplayMode(.inline)
            #endif
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
