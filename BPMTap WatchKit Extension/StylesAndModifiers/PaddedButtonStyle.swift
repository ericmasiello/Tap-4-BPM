//
//  PaddedButtonStyle.swift
//  BPMTap WatchKit Extension
//
//  Created by Eric Masiello on 6/29/20.
//  Copyright © 2020 Eric Masiello. All rights reserved.
//

import SwiftUI

struct PaddedButtonStyle: ButtonStyle {
    var padding: CGFloat
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(padding)
            .contentShape(
                Circle()
        )
            .background(
                Ring(isHighlighted: configuration.isPressed, shape: Circle())
            )
    }
}

struct PaddedButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        Button(action: {}) {
            Text("Yo")
        }.buttonStyle(PaddedButtonStyle(padding: 30))
    }
}
