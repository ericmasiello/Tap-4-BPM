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
    static var previews: some View {
        Text("Hello world").modifier(LabelViewModifier(maxHeight: 200))
    }
}
