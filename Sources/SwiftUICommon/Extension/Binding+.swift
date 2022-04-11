//
//  File.swift
//  
//
//  Created by Yusuke Hosonuma on 2022/04/11.
//

import SwiftUI

public extension Binding where Value: SliderValue {
    func sliderBinding() -> Binding<Double> {
        .init(
            get: {
                Double(self.wrappedValue.sliderIndex)
            },
            set: {
                self.wrappedValue = Value(fromSliderIndex: Int($0))
            }
        )
    }
}
