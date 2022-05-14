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

    @State private var imageSize: CGSize?

    public var body: some View {
        GeometryReader { geometry in
            Group {
                if let size = imageSize {
                    image
                        .resizable()
                        .aspectRatio(contentMode: contentMode)
                        .frame(size: size)
                } else {
                    // 💡 1st time only
                    image
                        .onChangeSize {
                            imageSize = Self.calculateImageSize(
                                bounds: geometry.size,
                                originalSize: $0,
                                contentMode: contentMode
                            )
                        }
                }
            }
        }
        .frame(size: imageSize)
    }

    static func calculateImageSize(bounds: CGSize, originalSize size: CGSize, contentMode: ContentMode) -> CGSize {
        if size.width < bounds.width {
            return size
        } else {
            if (contentMode == .fit && size.height < size.width) ||
                (contentMode == .fill && size.width < size.height)
            {
                //
                // Calculated from `width`.
                //
                return .init(
                    width: bounds.width,
                    height: size.height * (bounds.width / size.width)
                )
            } else {
                //
                // Calculated from `height`.
                //
                // ⚠️ Can't get correct size from `bounds.height` when used in `ScrollView` and others.
                //
                let ratio = (size.width / size.height)
                return .init(
                    width: bounds.width * ratio,
                    height: size.height * (bounds.width / size.width) * ratio
                )
            }
        }
    }
}
