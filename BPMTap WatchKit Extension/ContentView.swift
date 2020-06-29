//
//  ContentView.swift
//  BPMTap WatchKit Extension
//
//  Created by Eric Masiello on 4/19/20.
//  Copyright © 2020 Eric Masiello. All rights reserved.
//

import SwiftUI

let HEX_SIZE: CGFloat = 40
let BUTTON_PADDING: CGFloat = 30
let BUTTON_STROKE_WIDTH: CGFloat = 4
let TOTAL_CLICKS = 4
let ANIMATION_DURATION = 0.2

struct Ring<S: Shape>: View {
    var isHighlighted: Bool
    var shape: S
    
    var body: some View {
        ZStack {
            shape
                .stroke(Color.brandTeal, lineWidth: BUTTON_STROKE_WIDTH)
                .overlay(shape.fill().opacity(0.2))
        }
    }
}

struct PaddedButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(BUTTON_PADDING)
            .contentShape(
                Circle()
        )
            .background(
                Ring(isHighlighted: configuration.isPressed, shape: Circle())
            )
    }
}

func timeToBPM(start: DispatchTime, end: DispatchTime, beatCount: Int) -> Double {
    let diff = end.uptimeNanoseconds - start.uptimeNanoseconds
    let seconds = Double(diff) / 1_000_000_000
    return ((Double(beatCount) - 1) * 60) / seconds
}

struct ContentView: View {
    @State private var isToggled = false
    @State private var clicks = 0
    @State private var start = DispatchTime.now()
    @State private var end = DispatchTime.now()
    @State private var bpm: Double = 0
    
    func handleClick() {
        if (self.clicks == 0) {
            self.start = DispatchTime.now()
        }
        self.clicks += 1
        
        if (self.clicks == TOTAL_CLICKS) {
            self.clicks = 0
            self.end = DispatchTime.now()
            self.bpm = timeToBPM(start: self.start, end: self.end, beatCount: TOTAL_CLICKS);
        }
    }
    
    func scale() -> CGFloat {
        // multiply TOTAL_CLICKS * 2 so it doesn't scale AS much
        return (CGFloat(self.clicks) / CGFloat(TOTAL_CLICKS * 2)) + 1
    }
    
    func calcLabelHeight(height: CGFloat) -> CGFloat {
        return (height - (HEX_SIZE + (BUTTON_PADDING * 2) + (BUTTON_STROKE_WIDTH * 2)) / 2)
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .center) {
                
                LinearGradient(Color.brandPurple, Color.brandPurple)
                    .overlay(LinearGradient(Color.brandPurple, Color.brandBlue.opacity(0.5)))
                    .overlay(Color.black.opacity(0.4))
                
                VStack {
                    Spacer().frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: self.calcLabelHeight(height: geometry.size.height))
                    
                    Button(action: self.handleClick) {
                        Hexagon()
                            .frame(width: HEX_SIZE, height: HEX_SIZE)
                            .opacity(0.85)
                            .overlay(Hexagon().stroke(Color.brandPurple, lineWidth: 3))
                            .scaleEffect(self.scale())
                            .animation(.easeIn(duration: ANIMATION_DURATION))
                            .overlay(
                                Text(String(self.clicks))
                                    .foregroundColor(Color.darkEnd)
                            )
                        
                    }
                    .buttonStyle(PaddedButtonStyle())
                    
                    if (self.clicks == 0 && self.bpm == 0) {
                        Text("Begin Tapping")
                        .foregroundColor(Color.white).font(.footnote)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: self.calcLabelHeight(height: geometry.size.height))
                    } else if self.clicks > 0 && self.clicks < 4 {
                        Text("- - -")
                        .foregroundColor(Color.white).font(.footnote)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: self.calcLabelHeight(height: geometry.size.height))
                    } else {
                        Text(String(format: "%.2f BPM", self.bpm))
                        .fontWeight(.semibold)
                        .foregroundColor(Color.white).font(.caption)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: self.calcLabelHeight(height: geometry.size.height))
                        .transition(.opacity)
                    }
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                
            }
        }
        
        .edgesIgnoringSafeArea(.all)
        .navigationBarTitle("BPM Tap")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

