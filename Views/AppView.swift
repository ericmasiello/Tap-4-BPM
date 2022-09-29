//
//  AppView.swift
//  Tap4BPM
//
//  Created by Eric Masiello on 9/25/22.
//

import SwiftUI

enum AppSize {
    case small
    case large
    case xLarge
}

struct AppView: View {
    @State private var isToggled = false
    @State private var clicks = 0
    @State private var start = DispatchTime.now()
    @State private var end = DispatchTime.now()
    @State private var bpm: Double = 0
    var size: AppSize = .large
    
    var hexSize: CGFloat {
        get {
            switch self.size {
            case .small:
                return 40
            case .large:
                return 120
            case .xLarge:
                return 180
            }
        }
    }
    
    var buttonPadding: CGFloat {
        get {
            switch self.size {
            case .xLarge:
                return 40
            default:
                return 30
            }
        }
    }
    
    var buttonStrokeWidth: CGFloat {
        get {
            switch self.size {
            case .xLarge:
                return 6
            default:
                return 4
            }
        }
    }
    
    func handleClick() {
        withAnimation(.linear(duration: 0.35), {
            if (self.clicks == 0) {
                self.start = DispatchTime.now()
            }
            self.clicks += 1
            
            if (self.clicks == TOTAL_CLICKS) {
                self.clicks = 0
                self.end = DispatchTime.now()
                self.bpm = BPM.calc(start: self.start, end: self.end, beatCount: TOTAL_CLICKS);
            }
        })
    }
    
    func scale() -> CGFloat {
        // multiply TOTAL_CLICKS * 2 so it doesn't scale AS much
        return (CGFloat(self.clicks) / CGFloat(TOTAL_CLICKS * 2)) + 1
    }
    
    func calcLabelHeight(_ height: CGFloat) -> CGFloat {
        return (height - (self.hexSize + (self.buttonPadding * 2) + (self.buttonStrokeWidth * 2)) / 2)
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .center) {
                
                LinearGradient(Color.brandPurple, Color.brandPurple)
                    .overlay(LinearGradient(Color.brandPurple, Color.brandBlue.opacity(0.5)))
                    .overlay(Color.black.opacity(0.4))
                
                VStack {
                    Spacer().frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: self.calcLabelHeight(geometry.size.height))
                    
                    Button(action: self.handleClick) {
                        Hexagon()
                            .foregroundColor(Color.white)
                            .frame(width: self.hexSize, height: self.hexSize)
                            .opacity(0.85)
                            .overlay(Hexagon().stroke(Color.brandPurple, lineWidth: 3))
                            .scaleEffect(self.scale())
                            .animation(.spring(response: 0.3, dampingFraction: 0.4, blendDuration: 0))
                            .overlay(
                                // TODO: move this to a component
                                Text(String(self.clicks))
                                    .font(self.size == .large ? .title2 : .caption)
                                    .fontWeight(self.size == .large ? .heavy : .regular)
                                    .foregroundColor(Color.brandPurple)
                                    
                                    
                            )
                        
                    }
                    .paddedCircleStyle(padding: self.buttonPadding, strokeWidth: self.buttonStrokeWidth)
                    
                    TapLabel(clicks: clicks, size: size, bpm: bpm)
                        .footerLabel(maxHeight: self.calcLabelHeight(geometry.size.height))
                    
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                
            }
        }
        
        .edgesIgnoringSafeArea(.all)
        .navigationBarTitle("Tap 4 BPM")
        // ensure white icons for battery/time/signal
        .preferredColorScheme(.dark)
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView(size: .xLarge)
    }
}
