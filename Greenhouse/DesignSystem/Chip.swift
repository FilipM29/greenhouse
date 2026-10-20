import SwiftUI

struct Chip: View {
    let text: LocalizedStringKey
    var symbol: String?
    var foreground: Color
    var background: Color
    var border: Color?
    var cornerRadius: CGFloat = GHRadius.chip

    var body: some View {
        HStack(spacing: 4) {
            if let symbol {
                Image(systemName: symbol).imageScale(.small).accessibilityHidden(true)
            }
            Text(text)
        }
        .ghText(.chip)
        .foregroundStyle(foreground)
        .padding(.horizontal, 8)
        .padding(.vertical, 4)
        .background(background, in: RoundedRectangle(cornerRadius: cornerRadius))
        .overlay {
            if let border {
                RoundedRectangle(cornerRadius: cornerRadius).stroke(border, lineWidth: 1)
            }
        }
    }
}

extension Chip {
    /// Status chip in the colour of a care type, e.g. "Water Thu".
    static func care(_ style: CareStyle, _ text: LocalizedStringKey) -> Chip {
        Chip(text: text, symbol: style.symbol, foreground: style.color, background: style.tint)
    }

    /// Solid chip for overdue states.
    static func overdue(_ text: LocalizedStringKey) -> Chip {
        Chip(text: text, foreground: GHColor.onAccent, background: GHColor.overdue)
    }

    /// Pill used for filters and room pickers.
    static func filter(_ text: LocalizedStringKey, selected: Bool) -> Chip {
        Chip(
            text: text,
            foreground: selected ? GHColor.onAccent : GHColor.textPrimary,
            background: selected ? GHColor.accent : .clear,
            border: selected ? nil : GHColor.borderStrong,
            cornerRadius: GHRadius.pill
        )
    }
}

#Preview {
    VStack(alignment: .leading, spacing: 8) {
        Chip.care(.water, "Water Thu")
        Chip.care(.feed, "Feed today")
        Chip.care(.repot, "Repot spring")
        Chip.overdue("Water overdue")
        Chip.filter("Pet-safe", selected: true)
        Chip.filter("Low light", selected: false)
    }
    .padding()
    .background(GHColor.bg)
}
