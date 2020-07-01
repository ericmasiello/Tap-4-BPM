//
//  BPM.swift
//  BPMTap WatchKit Extension
//
//  Created by Eric Masiello on 6/30/20.
//  Copyright © 2020 Eric Masiello. All rights reserved.
//

import Foundation

struct BPM {
    static func calc(start: DispatchTime, end: DispatchTime, beatCount: Int) -> Double {
        let diff = end.uptimeNanoseconds - start.uptimeNanoseconds
        let seconds = Double(diff) / 1_000_000_000
        return ((Double(beatCount) - 1) * 60) / seconds
    }
}
