//
//  SwiftDataExampleApp.swift
//  SwiftDataExample
//
//  Created by Vidhyapathi on 24/09/24.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataExampleApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Student.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
