//
//  File.swift
//
//
//  Created by Yusuke Hosonuma on 2022/05/30.
//

import SwiftUI

// 🌱 Special Thanks.
// https://fivestars.blog/articles/reverse-masks-how-to/

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
public extension View {
    func invertedMask<Mask: View>(alignment: Alignment = .center, @ViewBuilder _ maskContent: () -> Mask) -> some View {
        mask {
            Rectangle()
                .overlay(alignment: alignment) {
                    maskContent()
                        .blendMode(.destinationOut)
                }
        }
    }
}
