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
                NavigationLink("WebView") {
                    SampleWebView()
                    #if os(iOS)
                        .navigationBarTitleDisplayMode(.inline)
                    #endif
                }
                NavigationLink("SliderValue") {
                    SliderView()
                    #if os(iOS)
                        .navigationBarTitleDisplayMode(.inline)
                    #endif
                }
                NavigationLink("Binding<T> to Binding<T?>") {
                    BindingOptionalView()
                    #if os(iOS)
                        .navigationBarTitleDisplayMode(.inline)
                    #endif
                }
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
            .navigationTitle("Example")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
