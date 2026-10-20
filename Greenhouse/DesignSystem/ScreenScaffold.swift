import SwiftUI

/// Common frame for a tab's root screen: background, side padding, large title.
struct ScreenScaffold<Content: View>: View {
    let title: LocalizedStringKey
    @ViewBuilder var content: Content

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: GHSpacing.sectionGap) {
                Text(title)
                    .ghText(.largeTitle)
                    .foregroundStyle(GHColor.textPrimary)
                    .accessibilityAddTraits(.isHeader)
                content
            }
            .padding(.horizontal, GHSpacing.screenPadding)
            .padding(.top, GHSpacing.sectionGap)
            // Room for the floating tab bar and its raised button.
            .padding(.bottom, 120)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .background(GHColor.bg.ignoresSafeArea())
    }
}
