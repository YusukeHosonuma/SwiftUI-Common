//
//  BindingMapView.swift
//  Example
//
//  Created by Yusuke Hosonuma on 2022/05/11.
//

import SwiftUI

struct BindingMapView: View {
    @State var boolString = "false"

    var body: some View {
        VStack {
            TextField("isOn", text: $boolString)
                .textFieldStyle(.roundedBorder)
                .autocapitalization(.none)

            //
            // 💡 Can edit `String` as `Bool`
            //
            Toggle("isOn", isOn: $boolString.map(
                get: { $0 == "true" },
                set: { $0 ? "true" : "false" }
            ))
        }
        .padding()
    }
}

struct BindingMapView_Previews: PreviewProvider {
    static var previews: some View {
        BindingMapView()
    }
}
