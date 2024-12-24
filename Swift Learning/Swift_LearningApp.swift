//
//  Swift_LearningApp.swift
//  Swift Learning
//
//  Created by Raj Soni on 18/12/24.
//

import SwiftUI
import SwiftData

@main
struct Swift_LearningApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: [Friend.self, Movie.self])
        }
    }
}
