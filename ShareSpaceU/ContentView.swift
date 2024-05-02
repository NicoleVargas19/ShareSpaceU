//
//  ContentView.swift
//  ShareSpaceU
//
//  Created by Nicole on 4/17/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var context
    var body: some View {
        MainView()
    }
}

#Preview {
    ContentView()
        .modelContainer(for: SSUser.self, inMemory: true)
}
