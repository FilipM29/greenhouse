import SwiftUI

enum AppTab: CaseIterable, Hashable, Sendable {
    case today, journal, plants, settings

    var title: LocalizedStringKey {
        switch self {
        case .today: "Today"
        case .journal: "Journal"
        case .plants: "Plants A–Z"
        case .settings: "Settings"
        }
    }

    var symbol: String {
        switch self {
        case .today: "drop"
        case .journal: "calendar"
        case .plants: "book.closed"
        case .settings: "gearshape"
        }
    }
}

/// Floating bar with a raised centre button, replacing the system tab bar.
struct FloatingTabBar: View {
    @Binding var selection: AppTab
    let onAdd: () -> Void

    private let raisedSize: CGFloat = 58
    private let lift: CGFloat = 26
    private let ring: CGFloat = 6

    var body: some View {
        HStack(spacing: 0) {
            item(.today)
            item(.journal)
            addButton
            item(.plants)
            item(.settings)
        }
        .padding(.horizontal, 4)
        .padding(.vertical, 6)
        // Border lives in the background so the raised button draws above it.
        .background {
            RoundedRectangle(cornerRadius: GHRadius.navBar)
                .fill(GHColor.surface)
                .overlay(RoundedRectangle(cornerRadius: GHRadius.navBar).stroke(GHColor.border, lineWidth: 1))
        }
        .padding(.horizontal, 12)
    }

    private func item(_ tab: AppTab) -> some View {
        let isSelected = selection == tab
        return Button {
            selection = tab
        } label: {
            VStack(spacing: 3) {
                Image(systemName: tab.symbol)
                    .font(.system(size: 20, weight: .regular))
                    .frame(height: 24)
                    .accessibilityHidden(true)
                Text(tab.title)
                    .ghText(isSelected ? .tabLabelActive : .tabLabel)
                    .lineLimit(1)
                    .minimumScaleFactor(0.8)
            }
            .foregroundStyle(isSelected ? GHColor.accent : GHColor.textSecondary)
            .frame(maxWidth: .infinity, minHeight: 48)
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
        .accessibilityAddTraits(isSelected ? .isSelected : [])
    }

    private var addButton: some View {
        Button(action: onAdd) {
            Image(systemName: "plus")
                .font(.system(size: 24, weight: .semibold))
                .foregroundStyle(GHColor.onAccent)
                .frame(width: raisedSize, height: raisedSize)
                .background(GHColor.accent, in: RoundedRectangle(cornerRadius: GHRadius.raisedButton))
                // Ring in the screen background colour separates the button from the bar.
                .background {
                    RoundedRectangle(cornerRadius: GHRadius.raisedButton + ring)
                        .fill(GHColor.bg)
                        .padding(-ring)
                }
        }
        .buttonStyle(.plain)
        .accessibilityLabel("Add plant")
        .frame(width: raisedSize + 8, height: 48)
        .offset(y: -lift)
    }
}

#Preview {
    @Previewable @State var tab = AppTab.today
    VStack {
        Spacer()
        FloatingTabBar(selection: $tab) {}
    }
    .background(GHColor.bg)
}
