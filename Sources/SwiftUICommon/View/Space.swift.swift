import SwiftUI

public struct Space: View {
    private var width: CGFloat?
    private var height: CGFloat?

    public var body: some View {
        if let width {
            Spacer().frame(width: width)
        } else if let height {
            Spacer().frame(height: height)
        }
    }
}

public extension Space {
    init(width: CGFloat) {
        self.width = width
        height = nil
    }

    init(height: CGFloat) {
        width = nil
        self.height = height
    }
}
