import SwiftUI

/// Plain sRGB components parsed from a 0xRRGGBB value. Kept separate from
/// `Color` so the parsing can be unit-tested without resolving a color.
struct RGB: Equatable, Sendable {
    let red: Double
    let green: Double
    let blue: Double

    init(hex: UInt32) {
        red = Double((hex >> 16) & 0xFF) / 255
        green = Double((hex >> 8) & 0xFF) / 255
        blue = Double(hex & 0xFF) / 255
    }
}

extension Color {
    init(hex: UInt32, opacity: Double = 1) {
        let rgb = RGB(hex: hex)
        self.init(.sRGB, red: rgb.red, green: rgb.green, blue: rgb.blue, opacity: opacity)
    }
}

/// Design tokens from the design reference. Dark mode only for now.
enum GHColor {
    static let bg = Color(hex: 0x0E1612)
    static let bgSheetBackdrop = Color(hex: 0x080D0A)
    static let surface = Color(hex: 0x17221C)
    static let surfaceRaised = Color(hex: 0x24372B)
    static let surfacePhoto = Color(hex: 0x1C2C22)
    static let border = Color(hex: 0x2B3B31)
    static let borderStrong = Color(hex: 0x3A4D41)
    static let divider = Color(hex: 0x22302A)

    static let textPrimary = Color(hex: 0xE8EFE9)
    static let textSecondary = Color(hex: 0x9FB3A6)
    static let textTertiary = Color(hex: 0x8EA396)

    static let accent = Color(hex: 0xB8E06A)
    static let onAccent = Color(hex: 0x0E1612)

    static let water = Color(hex: 0x7CC4F2)
    static let waterTint = Color(hex: 0x16263A)
    static let feed = Color(hex: 0xF2B66D)
    static let feedTint = Color(hex: 0x2A2418)
    static let feedTile = Color(hex: 0x3A2C18)
    static let repot = Color(hex: 0xC9A7F5)
    static let repotTint = Color(hex: 0x251E33)

    static let overdue = Color(hex: 0xFF9C85)
    static let successFlash = Color(hex: 0x1F3326)

    static let warningBg = Color(hex: 0x2A2418)
    static let warningBorder = Color(hex: 0x5A4628)
    static let warningText = Color(hex: 0xF2D7AE)
}
