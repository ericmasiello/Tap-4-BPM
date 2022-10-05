//
//  Ring.swift
//  BPMTap WatchKit Extension
//
//  Created by Eric Masiello on 6/29/20.
//  Copyright © 2020 Eric Masiello. All rights reserved.
//

import SwiftUI

struct RingView<S: Shape>: View {
    var isHighlighted: Bool
    var shape: S
    var strokeWidth: CGFloat
    
    var body: some View {
        ZStack {
            shape
                .stroke(Color.brandTeal.opacity(isHighlighted ? 0.5 : 1), lineWidth: strokeWidth)
                .overlay(shape.fill().opacity(0.2))
                .animation(.easeIn)
        }
    }
}

struct Ring_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RingView(isHighlighted: false, shape: Circle(), strokeWidth: 4.0)
            RingView(isHighlighted: true, shape: Circle(), strokeWidth: 4.0)
        }
        
    }
}
