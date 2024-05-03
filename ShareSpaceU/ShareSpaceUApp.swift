//
//  ShareSpaceUApp.swift
//  ShareSpaceU
//
//  Created by Nicole on 4/17/24.
//

import SwiftUI
import SwiftData

@main
struct ShareSpaceUApp: App {
//    var sharedModelContainer: ModelContainer = {
//        let schema = Schema([
//            SSUser.self,
//        ])
//        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)
//
//        do {
//            return try ModelContainer(for: schema, configurations: [modelConfiguration])
//        } catch {
//            fatalError("Could not create ModelContainer: \(error)")
//        }
//    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [SSUser.self])
    }
}
