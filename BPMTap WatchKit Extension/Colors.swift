//
//  Colors.swift
//  BPMTap WatchKit Extension
//
//  Created by Eric Masiello on 6/22/20.
//  Copyright © 2020 Eric Masiello. All rights reserved.
//

import Foundation
import SwiftUI

extension Color {
    static let darkStart = Color(red: 50 / 255, green: 60 / 255, blue: 65 / 255)
    static let darkEnd = Color(red: 25 / 255, green: 25 / 255, blue: 30 / 255)
    
    static let lightStart = Color(red: (255 - 50) / 255, green: (255 - 60) / 255, blue: (255 - 65) / 255)
    static let lightEnd = Color(red: (255 - 25) / 255, green: (255 - 25) / 255, blue: (255 - 30) / 255)
    
    static let brandPurple = Color(red: 78 / 255, green: 0 / 255, blue: 94 / 255)
    static let brandBlue = Color(red: 19 / 255, green: 52 / 255, blue: 185 / 255)
    static let brandPink = Color(red: 201 / 255, green: 0 / 255, blue: 68 / 255)
    static let brandTeal = Color(red: 54 / 255, green: 255 / 255, blue: 187 / 255)
}

extension LinearGradient {
    init(_ colors: Color...) {
        self.init(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}
