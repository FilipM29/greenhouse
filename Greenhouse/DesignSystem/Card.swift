import SwiftUI

struct Card<Content: View>: View {
    var background: Color = GHColor.surface
    var border: Color = GHColor.border
    @ViewBuilder var content: Content

    var body: some View {
        content
            .padding(GHSpacing.cardPadding)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(background, in: RoundedRectangle(cornerRadius: GHRadius.card))
            .overlay(RoundedRectangle(cornerRadius: GHRadius.card).stroke(border, lineWidth: 1))
    }
}

#Preview {
    Card {
        Text("Monstera").ghText(.headline).foregroundStyle(GHColor.textPrimary)
    }
    .padding()
    .background(GHColor.bg)
}
