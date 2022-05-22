//
//  File.swift
//
//
//  Created by Yusuke Hosonuma on 2022/04/11.
//

import CasePaths
import SwiftUI

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
    // 🌱 Experimental.
    //
    // `Binding<Value>` -> `Binding<NewValue>` (`set` can be return `nil`)
    //
    // func map<NewValue>(get: @escaping (Value) -> NewValue, set: @escaping (NewValue) -> Value?) -> Binding<NewValue> {
    //     .init(
    //         get: { get(wrappedValue) },
    //         set: {
    //             if let value = set($0) {
    //                 wrappedValue = value
    //             }
    //         }
    //     )
    // }
    //

    //
    // `Binding<T>` -> `Binding<T?>`
    //
    func optional() -> Binding<Value?> {
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
    func wrapped<Wrapped>() -> Binding<Wrapped>? where Value == Wrapped? {
        if let value = wrappedValue {
            return .init(
                get: { value },
                set: { wrappedValue = $0 }
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

extension Binding where Value == Bool {
    func inverted() -> Binding<Bool> {
        .init(
            get: { !wrappedValue },
            set: { wrappedValue = !$0 }
        )
    }
}

public extension Binding where Value: SliderValue {
    func slider() -> Binding<Double> {
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
