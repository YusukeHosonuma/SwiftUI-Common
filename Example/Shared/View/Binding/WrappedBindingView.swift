//
//  WrappedBindingView.swift
//  Example
//
//  Created by Yusuke Hosonuma on 2022/05/08.
//

import SwiftUI

struct WrappedBindingView: View {
    @State var nilString: String? = nil
    @State var string: String? = "Swift"

    var body: some View {
        VStack {
            OptionalTextEditView(optionalString: $nilString)
            OptionalTextEditView(optionalString: $string)
        }
    }
}

private struct OptionalTextEditView: View {
    @Binding var optionalString: String? // 💡 `Binding<String?>`

    var body: some View {
        //
        // ✅ `Binding<String?>` -> `Binding<String>?`
        //
        if let binding = $optionalString.wrappedBinding() {
            TextField("placeholder", text: binding) // 💡 require `Binding<String>`
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
        } else {
            Text("nil")
        }
    }
}
