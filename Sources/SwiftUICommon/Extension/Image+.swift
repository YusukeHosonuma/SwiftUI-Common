//
//  File.swift
//  
//
//  Created by Yusuke Hosonuma on 2022/05/09.
//

import SwiftUI

public extension Image {
    #if os(macOS)
    init(image: NSImage) {
        self = Image(nsImage: image)
    }
    #else
    init(image: UIImage) {
        self = Image(uiImage: image)
    }
    #endif
}
