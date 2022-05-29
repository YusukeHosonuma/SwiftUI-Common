//
//  File.swift
//
//
//  Created by Yusuke Hosonuma on 2022/05/29.
//

import SwiftUI

public extension View {
    func onReceive(notification name: Notification.Name, perform: @escaping (Notification) -> Void) -> some View {
        onReceive(NotificationCenter.default.publisher(for: name), perform: perform)
    }
}
