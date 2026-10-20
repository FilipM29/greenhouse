import SwiftUI

struct RootView: View {
    @State private var selection: AppTab = .today
    @State private var showingAddSheet = false

    var body: some View {
        // TabView keeps each tab's state alive; the system bar is hidden in
        // favour of the floating one.
        TabView(selection: $selection) {
            Tab(value: AppTab.today) { TodayView().toolbarVisibility(.hidden, for: .tabBar) }
            Tab(value: AppTab.journal) { JournalView().toolbarVisibility(.hidden, for: .tabBar) }
            Tab(value: AppTab.plants) { PlantsView().toolbarVisibility(.hidden, for: .tabBar) }
            Tab(value: AppTab.settings) { SettingsView().toolbarVisibility(.hidden, for: .tabBar) }
        }
        .safeAreaInset(edge: .bottom, spacing: 0) {
            FloatingTabBar(selection: $selection) { showingAddSheet = true }
        }
        .background(GHColor.bg.ignoresSafeArea())
        .sheet(isPresented: $showingAddSheet) {
            AddPlantSheet()
        }
    }
}

#Preview {
    RootView().preferredColorScheme(.dark)
}
