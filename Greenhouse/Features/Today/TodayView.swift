import SwiftUI

struct TodayView: View {
    var body: some View {
        ScreenScaffold(title: "Today") {}
    }
}

#Preview {
    TodayView().preferredColorScheme(.dark)
}
