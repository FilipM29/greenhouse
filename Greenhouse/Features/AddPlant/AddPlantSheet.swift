import SwiftUI

/// Placeholder for the add-plant flow (built in a later phase).
struct AddPlantSheet: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack(alignment: .leading, spacing: GHSpacing.sectionGap) {
            HStack {
                Spacer()
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "xmark")
                        .foregroundStyle(GHColor.textPrimary)
                        .frame(width: GHSpacing.minTapTarget, height: GHSpacing.minTapTarget)
                        .background(GHColor.surface, in: RoundedRectangle(cornerRadius: GHRadius.button))
                }
                .buttonStyle(.plain)
                .accessibilityLabel("Close")
            }
            Text("What plant is it?")
                .ghText(.largeTitle)
                .foregroundStyle(GHColor.textPrimary)
                .accessibilityAddTraits(.isHeader)
            Spacer()
        }
        .padding(GHSpacing.screenPadding)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .presentationBackground(GHColor.bg)
        .presentationCornerRadius(GHRadius.sheetTop)
        .presentationDragIndicator(.visible)
    }
}

#Preview {
    AddPlantSheet().preferredColorScheme(.dark)
}
