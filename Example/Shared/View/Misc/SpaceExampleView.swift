import SwiftUI
import SwiftUICommon

struct SpaceExampleView: View {
    var body: some View {
        VStack {
            Color.blue
            Space(height: 10) // Alias for `Spacer().frame(height: 10)`
            Color.blue
            Space(height: 20) // Alias for `Spacer().frame(height: 20)`
            Color.blue
            HStack {
                Color.red
                Space(width: 10) // Alias for `Spacer().frame(width: 10)`
                Color.red
                Space(width: 20) // Alias for `Spacer().frame(width: 20)`
                Color.red
            }
        }
        .frame(width: 200, height: 200)
        .padding(8)
        .border(.black, width: 2)
    }
}

struct SpaceExampleView_Previews: PreviewProvider {
    static var previews: some View {
        SpaceExampleView()
    }
}
