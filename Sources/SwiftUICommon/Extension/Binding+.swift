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

public extension Binding {
    func optionalBinding() -> Binding<Value?> {
        .init(
            get: { self.wrappedValue },
            set: {
                if let value = $0 {
                    self.wrappedValue = value
                }
            }
        )
    }
}
