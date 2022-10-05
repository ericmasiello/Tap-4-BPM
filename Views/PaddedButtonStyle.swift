//
//  PaddedButtonStyle.swift
//  BPMTap WatchKit Extension
//
//  Created by Eric Masiello on 6/29/20.
//  Copyright © 2020 Eric Masiello. All rights reserved.
//
import SwiftUI

extension Button {
    func paddedCircleStyle(padding: CGFloat, strokeWidth: CGFloat) -> some View {
        self.buttonStyle(PaddedButtonStyle(padding: padding, strokeWidth: strokeWidth))
    }
}

struct PaddedButtonStyle: ButtonStyle {
    var padding: CGFloat
    var strokeWidth: CGFloat
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(padding)
            .contentShape(
                Circle()
        )
            .background(
                RingView(isHighlighted: configuration.isPressed, shape: Circle(), strokeWidth: strokeWidth)
            )
    }
}

struct PaddedButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        Button(action: {}) {
            Text("Yo")
        }.paddedCircleStyle(padding: 30, strokeWidth: 4)
    }
}
