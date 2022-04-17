//
//  BorderSampleView.swift
//  Example
//
//  Created by Yusuke Hosonuma on 2022/04/15.
//

import SwiftUI

enum Fruit: String, CaseIterable, Identifiable {
    case apple = "Apple"
    case orange = "Orange"
    case banana = "Banana"
    var id: String { rawValue }
    var color: Color {
        switch self {
        case .apple:
            return .red
        case .orange:
            return .orange
        case .banana:
            return .yellow
        }
    }
}

struct WhenLetView: View {
    @State var selection: Fruit? = .apple // 💡 Allow non-selected (nil).
    
    var body: some View {
        VStack {
            Text("Selected fruit color.")
                //
                // ✅ Like `if let fruit = selection { ... }`
                //
                .whenLet(selection) { view, fruit in
                    view.foregroundColor(fruit.color)
                }

            Picker("Fruits", selection: $selection) {
                ForEach(Fruit.allCases, id: \.rawValue) { fruit in
                    Text(fruit.rawValue).tag(Fruit?(fruit))
                }
                Text("none").tag(Fruit?(nil))
            }
            .pickerStyle(.segmented)
        }
        .padding()
    }
}

struct WhenLetView_Previews: PreviewProvider {
    static var previews: some View {
        WhenLetView()
    }
}
