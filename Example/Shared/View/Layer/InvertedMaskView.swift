//
//  InvertedMaskView.swift
//  Example
//
//  Created by Yusuke Hosonuma on 2022/05/30.
//

import SwiftUI

struct InvertedMaskView: View {
    var body: some View {
        if #available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *) {
            Color.blue
                .invertedMask {
                    Image(systemName: "swift")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                }
        } else {
            Text("iOS 15+ / macOS 12+ only")
        }
    }
}
