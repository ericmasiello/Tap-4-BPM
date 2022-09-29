//
//  TapLabel.swift
//  Tap4BPM
//
//  Created by Eric Masiello on 9/29/22.
//

import SwiftUI

enum TapState {
    case idle
    case tapping
    case ready
}

struct TapLabel: View {
    
    var clicks: Int
    var size: AppSize
    var bpm: Double = 0.0
    
    var tapState: TapState {
        get {
            if (clicks == 0 && bpm == 0) {
                return .idle
            }
            else if clicks > 0 && clicks < 4 {
                return .tapping
            }
            return .ready
        }
    }
    
    var label: String {
        switch(tapState) {
        case .idle:
            return "Begin Tapping"
        case.tapping:
            return "- - -"
        case .ready:
            return String(format: "%.2f BPM", self.bpm)
        }
    }
    
    var font: Font {
        
        switch(size) {
        case .small:
            return .caption;
        case .large:
            return .subheadline;
        case .xLarge:
            return .title2
        }
        
        if (self.size == .small) {
            return .caption
        }
        return .subheadline
    }
    
    var weight: Font.Weight {
        switch(size) {
        case .small:
            return tapState == .ready ? .bold : .regular
        default:
            return .heavy
        }
    }
    
    
    var body: some View {
        
        Text(label).font(font).fontWeight(weight)
        
        
    }
}

struct TapLabel_Previews: PreviewProvider {
    static var previews: some View {
        VStack(alignment: .center){
            ScrollView {
                Group {
                    TapLabel(clicks: 0, size: .small).padding()
                    TapLabel(clicks: 2, size: .small).padding()
                    TapLabel(clicks: 4, size: .small, bpm: 172.2).padding()
                    Text("----")
                }
                Group {
                    TapLabel(clicks: 0, size: .large).padding()
                    TapLabel(clicks: 2, size: .large).padding()
                    TapLabel(clicks: 4, size: .large, bpm: 172.2).padding()
                    Text("----")
                }
                
                Group {
                    TapLabel(clicks: 0, size: .xLarge).padding()
                    TapLabel(clicks: 2, size: .xLarge).padding()
                    TapLabel(clicks: 4, size: .xLarge, bpm: 172.2).padding()
                }
            }
        }
        
    }
}
