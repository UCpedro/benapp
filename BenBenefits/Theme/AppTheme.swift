import SwiftUI

enum AppTheme {
    static let background = Color(hex: "#F4F6FB")
    static let cardBackground = Color.white
    static let primaryText = Color(hex: "#111827")
    static let secondaryText = Color(hex: "#6B7280")
    static let accent = Color(hex: "#2563EB")

    static let heroGradient = LinearGradient(
        colors: [Color(hex: "#1D4ED8"), Color(hex: "#4F46E5")],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}
