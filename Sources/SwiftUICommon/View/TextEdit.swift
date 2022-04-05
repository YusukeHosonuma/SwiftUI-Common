//
//  File.swift
//
//
//  Created by Yusuke Hosonuma on 2022/03/28.
//

import SwiftUI

public struct TextEdit: View {
    @Binding private var text: String

    private let placeHolder: String?
    private let font: Font

    public init(_ placeHolder: String? = nil, text: Binding<String>, font: Font) {
        self.placeHolder = placeHolder
        _text = text
        self.font = font
    }

    public var body: some View {
        ZStack(alignment: .topLeading) {
            Group {
                TextEditor(text: $text)
                if text.isEmpty, let placeHolder = placeHolder {
                    Text(placeHolder)
                        .foregroundColor(.gray)
                        .opacity(0.5)
                        .padding(padding)
                }
            }
            .font(font)
        }
    }

    private var padding: EdgeInsets {
        #if os(macOS)
        EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 0)
        #else
        EdgeInsets(top: 9, leading: 5, bottom: 0, trailing: 0)
        #endif
    }
}

struct TextEdit_Previews: PreviewProvider {
    static var previews: some View {
        TextEdit("Please paste.", text: .constant(""), font: .custom("SF Mono", size: 16))
    }
}
