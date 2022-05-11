//
//  File.swift
//
//
//  Created by Yusuke Hosonuma on 2022/04/11.
//

import CasePaths
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
    //
    // `Binding<Value>` -> `Binding<NewValue>`
    //
    func map<NewValue>(get: @escaping (Value) -> NewValue, set: @escaping (NewValue) -> Value) -> Binding<NewValue> {
        .init(
            get: { get(wrappedValue) },
            set: { wrappedValue = set($0) }
        )
    }

    //
    // `Binding<T>` -> `Binding<T?>`
    //
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

    //
    // `Binding<T?>` -> `Binding<T>?`
    //
    func wrappedBinding<Wrapped>() -> Binding<Wrapped>? where Value == Wrapped? {
        if let value = wrappedValue {
            return .init(
                get: { value },
                set: { self.wrappedValue = $0 }
            )
        } else {
            return nil
        }
    }

    //
    // `Binding<Enum>` -> `Binding<AssociatedValue>?`
    //
    func `case`<AssociatedValue>(_ path: CasePath<Value, AssociatedValue>) -> Binding<AssociatedValue>? {
        if let value = path.extract(from: wrappedValue) {
            return .init(
                get: { value },
                set: { wrappedValue = path.embed($0) }
            )
        } else {
            return nil
        }
    }
}
