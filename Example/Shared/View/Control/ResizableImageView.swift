//
//  ResizableImageView.swift
//  Example (iOS)
//
//  Created by Yusuke Hosonuma on 2022/05/13.
//

import SwiftUI
import SwiftUICommon

struct ResizableImageView: View {
    var body: some View {
        ScrollView {
            HStack {
                Spacer()
                VStack(spacing: 40) {
                    Group {
                        ResizableImage(systemName: "swift", contentMode: .fit)
                        ResizableImage(systemName: "swift", contentMode: .fill)

                        ResizableImage("sado-island", contentMode: .fit)
                        ResizableImage("sado-island", contentMode: .fill)

                        ResizableImage("building", contentMode: .fit)
                        ResizableImage("building", contentMode: .fill)
                    }
                    .frame(width: 140, height: 140)
                    .border(.red)
                }
                Spacer()
            }
        }
    }
}
