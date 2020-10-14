//
//  BPMTapNewApp.swift
//  BPMTapNew WatchKit Extension
//
//  Created by Eric Masiello on 10/14/20.
//

import SwiftUI

@main
struct BPMTapNewApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
