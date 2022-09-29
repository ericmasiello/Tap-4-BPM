//
//  ContentView.swift
//  Tap4BPM
//
//  Created by Eric Masiello on 9/24/22.
//

import SwiftUI

struct ContentView: View {
    @State private var viewSize: CGSize = .zero
    
    var derivedSize: AppSize {
        get {
            switch (viewSize.width) {
            case 0..<500:
                return .large
            default:
                return .xLarge
            }
        }
    }
    
    var body: some View {
        GeometryReader { geometry in
            AppView(size: derivedSize).onAppear(perform: {
                print(geometry.size.width)
            }).onAppear {
                viewSize = geometry.size
              }.onChange(of: geometry.size) { newSize in
                  viewSize = newSize
              }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
