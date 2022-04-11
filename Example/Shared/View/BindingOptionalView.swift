//
//  BindingOptionalView.swift
//  Example
//
//  Created by Yusuke Hosonuma on 2022/04/11.
//

import SwiftUI
import SwiftUICommon

enum Menu: Int {
    case all
    case star
}

struct BindingOptionalView: View {
    @SceneStorage("selection") var selection: Menu = .all
    
    var body: some View {
        #if os(macOS)
        let optionalSelection = $selection.optionalBinding() // ✅
        NavigationView {
            List {
                NavigationLink(tag: Menu.all, selection: optionalSelection, destination: { Text("1") }) {
                    Label("All", systemImage: "list.bullet")
                }
                NavigationLink(tag: Menu.star, selection: optionalSelection, destination: { Text("2") }) {
                    Label("Star", systemImage: "star.fill")
                }
            }
        }
        #else
        TabView(selection: $selection) {
            Text("1")
                .tabItem { Label("All", systemImage: "list.bullet") }
                .tag(Menu.all)
            Text("2")
                .tabItem { Label("Star", systemImage: "star.fill") }
                .tag(Menu.star)
        }
        #endif
    }
}
