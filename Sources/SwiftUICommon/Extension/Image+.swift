//
//  File.swift
//  
//
//  Created by Yusuke Hosonuma on 2022/05/09.
//

import SwiftUI

public extension Image {
    #if canImport(AppKit)
    init(image: NSImage) {
        self = Image(nsImage: image)
    }
    #endif
    
    #if canImport(UIKit)
    init(image: UIImage) {
        self = Image(uiImage: image)
    }
    #endif
}
