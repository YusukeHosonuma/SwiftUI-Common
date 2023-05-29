//
//  File.swift
//  
//
//  Created by Yusuke Hosonuma on 2023/05/29.
//

import SwiftUI

/// `label`が`EmptyView`の`NavigationLink`。
public struct HiddenLink<Destination: View>: View {
    private var navigationLink: () -> NavigationLink<EmptyView, Destination>

    public init(
        @ViewBuilder destination: @escaping () -> Destination
    ) {
        navigationLink = {
            NavigationLink(
                destination: destination(),
                label: { EmptyView() }
            )
        }
    }

    public init(
        isActive: Binding<Bool>,
        @ViewBuilder destination: @escaping () -> Destination
    ) {
        navigationLink = {
            NavigationLink(
                destination: destination(),
                isActive: isActive,
                label: { EmptyView() }
            )
        }
    }

    public init<V: Hashable>(
        tag: V,
        selection: Binding<V?>,
        @ViewBuilder destination: @escaping () -> Destination
    ) {
        navigationLink = {
            NavigationLink(
                tag: tag,
                selection: selection,
                destination: destination,
                label: { EmptyView() }
            )
        }
    }

    public var body: some View {
        navigationLink()
    }
}
