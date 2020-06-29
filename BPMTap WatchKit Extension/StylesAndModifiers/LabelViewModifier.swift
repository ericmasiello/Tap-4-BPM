//
//  LabelViewModifier.swift
//  BPMTap WatchKit Extension
//
//  Created by Eric Masiello on 6/29/20.
//  Copyright © 2020 Eric Masiello. All rights reserved.
//

import SwiftUI

struct LabelViewModifier: ViewModifier {
    var maxHeight: CGFloat;
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color.white)
            .font(.footnote)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: maxHeight)
            .transition(.opacity)
    }
}

struct Label_Previews: PreviewProvider {
    
    struct Demo: View {
        @State private var isToggled: Bool = false
        var body: some View {
            VStack {
                Toggle(isOn: $isToggled.animation(.linear)) {
                    Text("Hide/Show")
                }
                if (isToggled) {
                    Text("On")
                        .modifier(LabelViewModifier(maxHeight: 200))
                } else {
                    Text("Off")
                        .modifier(LabelViewModifier(maxHeight: 200))
                }
                
            }
        }
    }
    
    
    
    static var previews: some View {
        Demo()
    }
}
