import SwiftUI

/// Visual identity of a care type. Colour is always paired with an icon so it
/// is never the only signal.
enum CareStyle: CaseIterable, Sendable {
    case water, feed, repot

    var symbol: String {
        switch self {
        case .water: "drop"
        case .feed: "waterbottle"
        case .repot: "cup.and.saucer"
        }
    }

    var color: Color {
        switch self {
        case .water: GHColor.water
        case .feed: GHColor.feed
        case .repot: GHColor.repot
        }
    }

    var tint: Color {
        switch self {
        case .water: GHColor.waterTint
        case .feed: GHColor.feedTint
        case .repot: GHColor.repotTint
        }
    }
}
