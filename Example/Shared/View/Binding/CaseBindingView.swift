//
//  CaseBindingView.swift
//  Example
//
//  Created by Yusuke Hosonuma on 2022/05/11.
//

import SwiftUI
import CasePaths

enum EnumValue {
    //
    // 💡 Has associated-type `String`
    //
    case string(String)

    //
    // 💡 Has associated-type `Bool`
    //
    case bool(Bool)
}

struct CaseBindingView: View {
    @State var value: EnumValue = .string("Swift")
    
    var body: some View {
        VStack(alignment: .center) {
            //
            // 💡 Note: `switch` statement is only for completeness check by compiler.
            // (Removal does not affect the operation)
            //
            switch value {
            case .string(_):
                //
                // ✅ Binding<Value> -> Binding<String>?
                //
                if let binding = $value.case(/EnumValue.string) {
                    TextField("placeholder", text: binding)
                }
                
            case .bool(_):
                //
                // ✅ Binding<Value> -> Binding<Int>?
                //
                if let binding = $value.case(/EnumValue.bool) {
                    Toggle("isOn", isOn: binding)
                }
            }

            Button("set: .string(\"CasePaths\")") {
                value = .string("CasePaths")
            }
            Button("set: .bool(true)") {
                value = .bool(true)
            }
            Button("set: .bool(false)") {
                value = .bool(false)
            }
        }
        .padding()
    }
}

struct CaseBindingView_Previews: PreviewProvider {
    static var previews: some View {
        CaseBindingView()
    }
}
