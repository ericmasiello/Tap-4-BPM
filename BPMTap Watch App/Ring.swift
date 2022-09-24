//
//  Ring.swift
//  BPMTap WatchKit Extension
//
//  Created by Eric Masiello on 6/29/20.
//  Copyright © 2020 Eric Masiello. All rights reserved.
//

import SwiftUI

struct Ring<S: Shape>: View {
    var isHighlighted: Bool
    var shape: S
    
    var body: some View {
        ZStack {
            shape
                .stroke(Color.brandTeal.opacity(isHighlighted ? 0.5 : 1), lineWidth: BUTTON_STROKE_WIDTH)
                .overlay(shape.fill().opacity(0.2))
                .animation(.easeIn)
        }
    }
}

struct Ring_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Ring(isHighlighted: false, shape: Circle())
            Ring(isHighlighted: true, shape: Circle())
        }
        
    }
}
