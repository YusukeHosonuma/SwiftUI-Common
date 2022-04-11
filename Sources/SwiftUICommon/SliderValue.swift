//
//  File.swift
//  
//
//  Created by Yusuke Hosonuma on 2022/04/11.
//

import Foundation

public protocol SliderValue {
    static var sliderRange: ClosedRange<Double> { get }
    var sliderIndex: Int { get }
    init(fromSliderIndex: Int)
}
