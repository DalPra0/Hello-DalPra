import SwiftUI

extension Color {
    static let drumPink = Color(hex: "#FF10F0")
    static let drumGreen = Color(hex: "#39FF14")
    static let drumCyan = Color(hex: "#00F5FF")
    static let drumOrange = Color(hex: "#FF5F1F")
    
    var drumColorName: String {
        switch self {
        case .drumPink: return "pink"
        case .drumGreen: return "green"
        case .drumCyan: return "cyan"
        case .drumOrange: return "orange"
        default: return ""
        }
    }
    
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 6: (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        default: (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(.sRGB, red: Double(r)/255, green: Double(g)/255, blue: Double(b)/255, opacity: Double(a)/255)
    }
}
