//
//  File.swift
//
//
//  Created by Yusuke Hosonuma on 2022/05/30.
//

import SwiftUI

public extension View {
    func border(_ color: Color, width: CGFloat = 1, edge: Edge.Set) -> some View {
        overlay(
            VStack(spacing: 0) {
                if edge == .all || edge == .vertical || edge == .top {
                    color.frame(height: width)
                }
                Spacer()
                if edge == .all || edge == .vertical || edge == .bottom {
                    color.frame(height: width)
                }
            }
        )
        .overlay(
            HStack(spacing: 0) {
                if edge == .all || edge == .horizontal || edge == .leading {
                    color.frame(width: width)
                }
                Spacer()
                if edge == .all || edge == .horizontal || edge == .trailing {
                    color.frame(width: width)
                }
            }
        )
    }
}

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
