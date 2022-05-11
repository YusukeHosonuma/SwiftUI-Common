//
//  SectionView.swift
//  Example (iOS)
//
//  Created by Yusuke Hosonuma on 2022/05/11.
//

import SwiftUI
import SwiftUICommon

struct SheetDismissView: View {
    @State var isPresented = false

    var body: some View {
        VStack {
            Button("Open sheet") {
                isPresented.toggle()
            }
            .sheet(isPresented: $isPresented) {
                ChildView()
            }
        }
    }
}

struct ChildView: View {
    //
    // ✅ Compatible to `@Environment(\.dismiss) var dismiss` in iOS 15.
    //
    @Dismiss var dismiss

    //
    // 💡 in iOS 14+
    //
    // @Environment(\.presentationMode) private var presentationMode

    var body: some View {
        VStack {
            Button("Close") {
                //
                // ✅ Same as `@Environment(\.dismiss)`
                //
                dismiss()

                //
                // 💡 in iOS 14
                //
                // presentationMode.wrappedValue.dismiss()
            }
        }
        .padding()
    }
}
