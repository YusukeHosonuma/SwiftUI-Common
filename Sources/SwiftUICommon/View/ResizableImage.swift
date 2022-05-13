//
//  File.swift
//
//
//  Created by Yusuke Hosonuma on 2022/05/12.
//

import SwiftUI

public extension ResizableImage {
    init(_ name: String, contentMode: ContentMode) {
        self.init(image: Image(name), contentMode: contentMode)
    }
    
    init(systemName: String, contentMode: ContentMode) {
        self.init(image: Image(systemName: systemName), contentMode: contentMode)
    }

    init(uiImage: UIImage, contentMode: ContentMode) {
        self.init(image: Image(uiImage: uiImage), contentMode: contentMode)
    }
}

public struct ResizableImage: View {
    private let image: Image
    private let contentMode: ContentMode
    
    @State private var size: CGSize?

    public var body: some View {
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
                    if (contentMode == .fit && imageSize.height < imageSize.width) ||
                        (contentMode == .fill && imageSize.width < imageSize.height)
                    {
                        //
                        // Calculated from `width`.
                        //
                        size = .init(
                            width: geometry.size.width,
                            height: imageSize.height * (geometry.size.width / imageSize.width)
                        )
                    } else {
                        //
                        // Calculated from `height`.
                        //
                        // ⚠️ Can't get correct size from `geometry.size.height` when used in `ScrollView` and others.
                        //
                        let ratio = (imageSize.width / imageSize.height)
                        size = .init(
                            width: geometry.size.width * ratio,
                            height: imageSize.height * (geometry.size.width / imageSize.width) * ratio
                        )
                    }
                }
            }
        }
        .frame(size: size)
    }
}
