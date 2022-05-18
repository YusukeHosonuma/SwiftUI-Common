//
//  ImageView.swift
//  Example
//
//  Created by Yusuke Hosonuma on 2022/05/09.
//

import SwiftUI

#if os(macOS)
private typealias XImage = NSImage
#else
private typealias XImage = UIImage
#endif

struct ImageView: View {
    var body: some View {
        Image(image: renderImage()) // ✅
            .resizable()
            .scaledToFit()
    }

    private func renderImage() -> XImage {
        // ⚠️ Assumes rendering code
        #if os(macOS)
        NSImage(named: "sado-island")!
        #else
        UIImage(named: "sado-island")!
        #endif
    }
}
