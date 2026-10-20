import SwiftUI

struct PrimaryButton: View {
    enum Style {
        case accent, water, feed, outline

        var fill: Color {
            switch self {
            case .accent: GHColor.accent
            case .water: GHColor.water
            case .feed: GHColor.feed
            case .outline: .clear
            }
        }

        var foreground: Color {
            self == .outline ? GHColor.textPrimary : GHColor.onAccent
        }
    }

    let title: LocalizedStringKey
    var systemImage: String?
    var style: Style = .accent
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 6) {
                if let systemImage {
                    Image(systemName: systemImage).accessibilityHidden(true)
                }
                Text(title)
            }
            .ghText(.button)
            .foregroundStyle(style.foreground)
            .frame(maxWidth: .infinity, minHeight: GHSpacing.minTapTarget)
            .background(style.fill, in: RoundedRectangle(cornerRadius: GHRadius.button))
            .overlay {
                if style == .outline {
                    RoundedRectangle(cornerRadius: GHRadius.button).stroke(GHColor.borderStrong, lineWidth: 1)
                }
            }
            .contentShape(RoundedRectangle(cornerRadius: GHRadius.button))
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    VStack(spacing: 10) {
        PrimaryButton(title: "Add to Living room", style: .accent) {}
        PrimaryButton(title: "Watered", systemImage: "drop", style: .water) {}
        PrimaryButton(title: "Skip", style: .outline) {}
    }
    .padding()
    .background(GHColor.bg)
}
