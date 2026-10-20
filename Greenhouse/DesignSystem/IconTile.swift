import SwiftUI

struct IconTile: View {
    var symbol: String
    var size: CGFloat = 48
    var background: Color = GHColor.surfaceRaised
    var foreground: Color = GHColor.accent

    var body: some View {
        Image(systemName: symbol)
            .font(.system(size: size * 0.5, weight: .regular))
            .foregroundStyle(foreground)
            .frame(width: size, height: size)
            .background(background, in: RoundedRectangle(cornerRadius: GHRadius.tile))
            .accessibilityHidden(true)
    }
}

#Preview {
    HStack {
        IconTile(symbol: "leaf")
        IconTile(symbol: "waterbottle", background: GHColor.feedTile, foreground: GHColor.feed)
    }
    .padding()
    .background(GHColor.bg)
}
