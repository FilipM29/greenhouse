import SwiftUI

@main
struct GreenhouseApp: App {
    var body: some Scene {
        WindowGroup {
            RootView()
                .preferredColorScheme(.dark)
                .tint(GHColor.accent)
        }
    }
}
