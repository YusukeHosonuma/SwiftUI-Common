//
//  File.swift
//
//
//  Created by Yusuke Hosonuma on 2022/04/11.
//

import SwiftUI

struct DebugView: View {
    @State var condition = false

    var body: some View {
        content(text: "Hello", number: 42)
            .padding()
    }

    func content(text: String, number: Int) -> some View {
        Text("\(text), \(number)")
            //
            // ✅ Useful for print arguments in subview method.
            //
            .debug {
                print("🍎 \(text)")
                print("🍊 \(number)")
            }
    }
}

struct DebugView_Previews: PreviewProvider {
    static var previews: some View {
        DebugView()
    }
}
