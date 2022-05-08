//
//  File.swift
//
//
//  Created by Yusuke Hosonuma on 2022/04/11.
//

import SwiftUI

struct EnabledView: View {
    @State var isEnabled = false

    var body: some View {
        VStack {
            // ✅ Readable
            Button("Hello") {}
                .enabled(isEnabled)
            
            // 😕 Not readable.
            Button("Hello") {}
                .disabled(isEnabled == false)

            Toggle("Enabled", isOn: $isEnabled)
        }
        .padding()
    }
}
