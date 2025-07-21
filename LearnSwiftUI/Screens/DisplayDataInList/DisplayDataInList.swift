//
//  DisplayDataInList.swift
//  LearnSwiftUI
//
//  Created by MEGABEE on 16/7/25.
//

import SwiftUI
import ThemeKit

struct DisplayDataInList: View {
    @Binding var scrums: [DailyScrum]
    @State private var isPresentingNewScrumView = false

    var body: some View {
        NavigationStack {
            List($scrums, id: \.id) { $scrum in
                NavigationLink(destination: DetailView(scrum: $scrum)) {
                    CardView(scrum: scrum)
                }.listRowBackground(scrum.theme.mainColor)
            }
            .toolbar {
                Button(action: {
                    isPresentingNewScrumView = true
                }) {
                    Image(systemName: "plus")
                }
            }
            .navigationTitle("Daily Scrums")
        }.sheet(isPresented: $isPresentingNewScrumView) {
            NewScrumSheet(scrums: $scrums)
        }
    }
}

#Preview {

    @Previewable @State var scrums = DailyScrum.sampleData

    DisplayDataInList(scrums: $scrums)
}
