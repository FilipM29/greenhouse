import Testing
import UIKit
@testable import Greenhouse

struct DesignSystemTests {
    @Test func hexParsesToSRGBComponents() {
        let accent = RGB(hex: 0xB8E06A)
        #expect(accent.red == Double(0xB8) / 255)
        #expect(accent.green == Double(0xE0) / 255)
        #expect(accent.blue == Double(0x6A) / 255)
        #expect(RGB(hex: 0x000000) == RGB(hex: 0))
        #expect(RGB(hex: 0xFFFFFF).red == 1)
    }

    @Test(arguments: ["SpaceGrotesk-Regular", "SpaceGrotesk-Medium", "SpaceGrotesk-Bold"])
    func bundledFontsLoad(name: String) {
        #expect(UIFont(name: name, size: 15) != nil)
    }

    @Test func everyTextWeightResolvesToABundledFont() {
        for weight in [GHFontWeight.regular, .medium, .semibold, .bold] {
            #expect(UIFont(name: weight.postScriptName, size: 15) != nil)
        }
    }

    @Test func symbolsExist() {
        let symbols = CareStyle.allCases.map(\.symbol) + AppTab.allCases.map(\.symbol) + ["plus", "xmark", "checkmark"]
        for symbol in symbols {
            #expect(UIImage(systemName: symbol) != nil, "Missing SF Symbol: \(symbol)")
        }
    }

    @Test func tabBarHasFourDestinations() {
        #expect(AppTab.allCases.count == 4)
    }
}
