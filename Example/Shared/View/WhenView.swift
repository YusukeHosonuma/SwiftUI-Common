//
//  File.swift
//  
//
//  Created by Yusuke Hosonuma on 2022/04/11.
//

import SwiftUI

struct WhenView: View {
    @State var condition = false
    
    var body: some View {
        VStack {
            Text("Hello")
                .when(condition) { // ✅
                    $0.underline()
                }
            Toggle("Underline", isOn: $condition)
        }
        .padding()
    }
}

struct WhenView_Previews: PreviewProvider {
    static var previews: some View {
        WhenView()
            .padding()
    }
}
