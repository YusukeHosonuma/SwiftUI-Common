//
//  File.swift
//
//
//  Created by Yusuke Hosonuma on 2022/05/12.
//

import SwiftUI

public extension Image {
    func original(or contentMode: ContentMode) -> some View {
        ResizableImage(image: self, contentMode: contentMode)
    }
}

private struct ResizableImage: View {
    let image: Image
    let contentMode: ContentMode

    @State private var size: CGSize?

    var body: some View {
        GeometryReader { geometry in
            Group {
                if let size = size {
                    image
                        .resizable()
                        .aspectRatio(contentMode: contentMode)
                        .frame(size: size)
                } else {
                    image.sizePreference() // 💡 get original image size. (1st time only)
                }
            }
            .onChangeSizePreference { imageSize in
                if imageSize.width < geometry.size.width {
                    size = imageSize
                } else {
                    size = .init(
                        width: geometry.size.width,
                        height: imageSize.height * (geometry.size.width / imageSize.width)
                    )
                }
            }
        }
        .frame(size: size)
    }
}
