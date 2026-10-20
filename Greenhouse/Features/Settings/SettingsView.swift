import SwiftUI

struct SettingsView: View {
    var body: some View {
        ScreenScaffold(title: "Settings") {}
    }
}

#Preview {
    SettingsView().preferredColorScheme(.dark)
}
