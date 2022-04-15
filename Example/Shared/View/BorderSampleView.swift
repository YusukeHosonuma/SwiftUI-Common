//
//  BorderSampleView.swift
//  Example
//
//  Created by Yusuke Hosonuma on 2022/04/15.
//

import SwiftUI

struct BorderSampleView: View {
    var body: some View {
        Text("Hello")
            .padding()
            .border(.red, edge: .vertical) // default `width` = 1
            .border(.blue, width: 8, edge: .leading)
    }
}

struct BorderSampleView_Previews: PreviewProvider {
    static var previews: some View {
        BorderSampleView()
    }
}
