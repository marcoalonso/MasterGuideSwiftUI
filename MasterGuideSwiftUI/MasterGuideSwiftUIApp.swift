//
//  MasterGuideSwiftUIApp.swift
//  MasterGuideSwiftUI
//
//  Created by Marco Alonso on 03/10/24.
//

import SwiftUI
import TipKit

@main
struct MasterGuideSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .task {
                    try? Tips.resetDatastore()
                    try? Tips.configure([
                        .displayFrequency(.immediate),
                        .datastoreLocation(.applicationDefault)
                    ])
                }
        }
    }
}
