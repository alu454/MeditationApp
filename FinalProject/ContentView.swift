//
//  ContentView.swift
//  FinalProject
//
//  Created by Alan Lu on 5/17/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    @StateObject private var completedDaysModel = CompletedDaysModel() // stores data for tracking page

    var body: some View {
        TabView {
            GuidedMeditationPage()// page on tips on meditation
                .tabItem {
                    Image(systemName: "lightbulb")
                    Text("Tips")
                }
            MusicPage() // page for listening to music
                .tabItem {
                    Image(systemName: "headphones")
                    Text("Music")
                }
            MeditationTimerPage(completedDaysModel: completedDaysModel) // page for meditation timer
                .tabItem {
                    Image(systemName: "hourglass")
                    Text("Timer")
                }
            ConsistencyTrackingPage(completedDaysModel: completedDaysModel) // page for calander to track consistency of meditation
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Calendar")
                }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
