//
//  File.swift
//
//
//  Created by Yusuke Hosonuma on 2022/05/12.
//

import SwiftUI

public extension CGSize {
    func contains(_ other: CGSize) -> Bool {
        width < other.width && height < other.height
    }
}
