//
//  File.swift
//
//
//  Created by Yusuke Hosonuma on 2022/03/20.
//

#if os(iOS)
import SwiftUI

public struct ActivityView: UIViewControllerRepresentable {
    private let activityItems: [Any]
    private let applicationActivities: [UIActivity]?

    public init(activityItems: [Any], applicationActivities: [UIActivity]? = nil) {
        self.activityItems = activityItems
        self.applicationActivities = applicationActivities
    }

    public func makeUIViewController(context _: Context) -> UIActivityViewController {
        UIActivityViewController(activityItems: activityItems, applicationActivities: applicationActivities)
    }

    public func updateUIViewController(_: UIActivityViewController, context _: Context) {}
}

struct ActivityView_Previews: PreviewProvider {
    @State static var isPresent = false

    static var previews: some View {
        Image(systemName: "square.and.arrow.up")
            .sheet(isPresented: .constant(true)) {
                ActivityView(activityItems: [URL(string: "https://github.com/YusukeHosonuma/Swift-Evolution-Browser")!])
            }
    }
}
#endif
