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
                    NavigationLink("WebView") {
                        SampleWebView()
                        #if os(iOS)
                            .navigationBarTitleDisplayMode(.inline)
                        #endif
                    }
                }

                Section("Binding") {
                    NavigationLink("Binding<T> to Binding<T?>") {
                        BindingOptionalView()
                        #if os(iOS)
                            .navigationBarTitleDisplayMode(.inline)
                        #endif
                    }
                }

                Section("View+") {
                    NavigationLink(".when(<condition>)") {
                        WhenView()
                        #if os(iOS)
                            .navigationBarTitleDisplayMode(.inline)
                        #endif
                    }
                    NavigationLink(".whenLet(<optional-value>)") {
                        WhenLetView()
                        #if os(iOS)
                            .navigationBarTitleDisplayMode(.inline)
                        #endif
                    }
                    NavigationLink(".border(.red, width: 1, edge: .top)") {
                        BorderSampleView()
                        #if os(iOS)
                            .navigationBarTitleDisplayMode(.inline)
                        #endif
                    }
                }

                Section("Misc") {
                    NavigationLink("SliderValue") {
                        SliderView()
                        #if os(iOS)
                            .navigationBarTitleDisplayMode(.inline)
                        #endif
                    }
                }

                Section("Debug") {
                    NavigationLink(".debug { ... }") {
                        DebugView()
                        #if os(iOS)
                            .navigationBarTitleDisplayMode(.inline)
                        #endif
                    }
                }
            }
            .navigationTitle("Example")
        }
    }
}

@available(iOS, introduced: 13.0, deprecated: 15.0)
extension Section where Parent == Text, Content: View, Footer == EmptyView {
    public init<S>(_ title: S, @ViewBuilder content: () -> Content) where S: StringProtocol {
        self.init(content: content) {
            Text(title)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
