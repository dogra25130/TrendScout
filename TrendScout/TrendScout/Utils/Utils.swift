//
//  Utils.swift
//  TrendScout
//
//  Created by Abhishek Dogra on 14/07/24.
//

import Foundation
import SwiftUI
class Utils {
    static var keyboardHeight: CGFloat = 0
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

public extension CGFloat {
    
    static let p1: CGFloat = 1.0
    static let p2: CGFloat = 2.0
    static let p4: CGFloat = 4.0
    static let p6: CGFloat = 6.0
    static let p8: CGFloat = 8.0
    static let p10: CGFloat = 10.0
    static let p12: CGFloat = 12.0
    static let p14: CGFloat = 14.0
    static let p15: CGFloat = 15.0
    static let p18: CGFloat = 18.0
    static let p16: CGFloat = 16.0
    static let p20: CGFloat = 20.0
    static let p22: CGFloat = 22.0
    static let p24: CGFloat = 24.0
    static let p28: CGFloat = 28.0
    static let p32: CGFloat = 32.0
    static let p36: CGFloat = 36.0
    static let p40: CGFloat = 40.0
    static let p42: CGFloat = 42.0
    static let p44: CGFloat = 44.0
    static let p48: CGFloat = 48.0
    static let p52: CGFloat = 52.0
    static let p56: CGFloat = 56.0
    static let p58: CGFloat = 58.0
    static let p60: CGFloat = 60.0
    static let p72: CGFloat = 72.0
    static let p80: CGFloat = 80.0
    static let p90: CGFloat = 90.0
    static let p100: CGFloat = 100.0
    static let p106: CGFloat = 106.0
    static let p110: CGFloat = 110.0
    
    static let r2: CGFloat = 2.0
    static let r4: CGFloat = 4.0
    static let r6: CGFloat = 6.0
    static let r8: CGFloat = 8.0
    static let r10: CGFloat = 10.0
    static let r12: CGFloat = 12.0
    static let r14: CGFloat = 14.0
    static let r16: CGFloat = 16.0
    static let r24: CGFloat = 24.0
    static let r32: CGFloat = 32.0
    static let r40: CGFloat = 40.0
}
