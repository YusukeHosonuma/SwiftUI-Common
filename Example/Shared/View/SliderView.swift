//
//  SliderView.swift
//  Example
//
//  Created by Yusuke Hosonuma on 2022/04/11.
//

import SwiftUI
import SwiftUICommon

enum TextSize: Int, CaseIterable {
    case xSmall = 0
    case small = 1
    case medium = 2
    case large = 3
    case xLarge = 4
    
    var name: String {
        switch self {
        case .xSmall: return "xSmall"
        case .small: return "small"
        case .medium: return "medium"
        case .large: return "large"
        case .xLarge: return "xLarge"
        }
    }
}

extension TextSize: SliderValue {
    static let sliderRange: ClosedRange<Double> = 0 ... Double(TextSize.allCases.count - 1)
    
    var sliderIndex: Int { rawValue }

    init(fromSliderIndex index: Int) {
        self = Self(rawValue: index)!
    }
}


struct SliderView: View {
    @State var textSize: TextSize = .medium
    
    var body: some View {
        VStack {
            Text("\(textSize.name)")
            Slider(
                value: $textSize.sliderBinding(),
                in: TextSize.sliderRange,
                step: 1
            )
        }
        .padding()
    }
}
