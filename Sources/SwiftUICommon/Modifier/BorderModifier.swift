//
//  File.swift
//  
//
//  Created by Yusuke Hosonuma on 2022/04/15.
//

import SwiftUI

public extension View {
    func border(_ color: Color, width: CGFloat = 1, edge: Edge.Set) -> some View {
        self.modifier(EdgeBorderModifier(color: color, width: width, edge: edge))
    }
}

struct EdgeBorderModifier: ViewModifier {
    private let color: Color
    private let width: CGFloat
    private let edge: Edge.Set
    
    init(color: Color, width: CGFloat, edge: Edge.Set) {
        self.color = color
        self.width = width
        self.edge = edge
    }
    
    func body(content: Content) -> some View {
        content
            .overlay(
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
