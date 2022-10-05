//
//  Hexagon.swift
//  BPMTap WatchKit Extension
//
//  Created by Eric Masiello on 6/21/20.
//  Copyright © 2020 Eric Masiello. All rights reserved.
//

import SwiftUI

struct HexagonView: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.maxX / 2, y: rect.maxY))
        
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY * 3/4))
        
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY * 1/4))
        
        path.addLine(to: CGPoint(x: rect.maxX / 2, y: 0))
        
        path.addLine(to: CGPoint(x: 0, y: rect.maxY * 1/4))
        path.addLine(to: CGPoint(x: 0, y: rect.maxY * 3/4))
        
        path.closeSubpath()
        
        return path
    }
}

struct Hexagon_Previews: PreviewProvider {

        
    static var previews: some View {
        Group {
          HexagonView()
            .foregroundColor(Color.blue)
            .frame(width: 100, height: 100)
            .overlay(
                HexagonView()
                    .stroke(Color.orange, lineWidth: 10)
            )
        HexagonView()
            .foregroundColor(Color.orange)
            .frame(width: 100, height: 100)
            .overlay(
                HexagonView()
                    .stroke(Color.blue, lineWidth: 10)
            )
        }
        
    }
}
