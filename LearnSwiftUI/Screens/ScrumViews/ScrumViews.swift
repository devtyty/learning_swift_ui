//
//  DisplayDataInList.swift
//  LearnSwiftUI
//
//  Created by MEGABEE on 16/7/25.
//

import SwiftData
import SwiftUI
import ThemeKit

struct ScrumViews: View {
    @Query(sort: \DailyScrum.title) private var scrums: [DailyScrum]

    @State private var isPresentingNewScrumView = false

    var body: some View {
        NavigationStack {
            List(scrums, id: \.id) { scrum in
                NavigationLink(destination: DetailView(scrum: scrum)) {
                    CardView(scrum: scrum)
                }.listRowBackground(scrum.theme.mainColor)
            }.toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button(action: {
                        isPresentingNewScrumView = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }

            .navigationTitle("Daily Scrums")
        }.sheet(isPresented: $isPresentingNewScrumView) {
            NewScrumSheet()
        }
    }
}

#Preview(traits: .dailyScrumsSampleData) {
    ScrumViews()
}
