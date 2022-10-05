//
//  TapLabel.swift
//  Tap4BPM
//
//  Created by Eric Masiello on 9/29/22.
//

import SwiftUI

struct TapLabelView: View {
    var clicks: Int
    var size: AppSize
    
    var font: Font {
        switch(size) {
        case .small:
            return .caption;
        case .large:
            return .title2;
        case .xLarge:
            return .title
        }
    }
    
    var weight: Font.Weight {
        switch(size) {
        case .small:
            return .regular
        default:
            return .heavy
        }
    }
    
    var body: some View {
        Text(String(clicks))
            .font(font)
            .fontWeight(weight)
    }
}

struct TapLabel_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            TapLabelView(clicks: 3, size: .small)
            TapLabelView(clicks: 3, size: .large)
            TapLabelView(clicks: 3, size: .xLarge)
        }
        
    }
}
