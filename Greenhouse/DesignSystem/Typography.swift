import SwiftUI

/// Space Grotesk ships static Regular, Medium and Bold. The design's 600
/// weight maps to Bold; there is no static SemiBold in the upstream release.
enum GHFontWeight: Sendable {
    case regular, medium, semibold, bold

    var postScriptName: String {
        switch self {
        case .regular: "SpaceGrotesk-Regular"
        case .medium: "SpaceGrotesk-Medium"
        case .semibold, .bold: "SpaceGrotesk-Bold"
        }
    }
}

struct GHTextStyle: Sendable {
    let size: CGFloat
    let weight: GHFontWeight
    let relativeTo: Font.TextStyle
    var tracking: CGFloat = 0
    var uppercase = false

    static let largeTitle = GHTextStyle(size: 32, weight: .bold, relativeTo: .largeTitle, tracking: -0.64)
    static let title = GHTextStyle(size: 28, weight: .bold, relativeTo: .title)
    static let headline = GHTextStyle(size: 18, weight: .semibold, relativeTo: .headline)
    static let body = GHTextStyle(size: 15, weight: .regular, relativeTo: .body)
    static let bodyMedium = GHTextStyle(size: 15, weight: .medium, relativeTo: .body)
    static let button = GHTextStyle(size: 15, weight: .semibold, relativeTo: .body)
    static let subhead = GHTextStyle(size: 13, weight: .regular, relativeTo: .subheadline)
    static let caption = GHTextStyle(size: 12, weight: .medium, relativeTo: .caption)
    static let captionCaps = GHTextStyle(size: 12, weight: .medium, relativeTo: .caption, tracking: 0.96, uppercase: true)
    static let chip = GHTextStyle(size: 12, weight: .semibold, relativeTo: .caption)
    static let stat = GHTextStyle(size: 26, weight: .bold, relativeTo: .title)
    static let tabLabel = GHTextStyle(size: 11, weight: .medium, relativeTo: .caption2)
    static let tabLabelActive = GHTextStyle(size: 11, weight: .semibold, relativeTo: .caption2)
}

extension Font {
    /// Custom font that scales with Dynamic Type.
    static func gh(_ style: GHTextStyle) -> Font {
        .custom(style.weight.postScriptName, size: style.size, relativeTo: style.relativeTo)
    }
}

extension View {
    func ghText(_ style: GHTextStyle) -> some View {
        font(.gh(style))
            .tracking(style.tracking)
            .textCase(style.uppercase ? .uppercase : nil)
    }
}
