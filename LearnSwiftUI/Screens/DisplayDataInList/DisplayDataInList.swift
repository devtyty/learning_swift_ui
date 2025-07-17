//
//  DisplayDataInList.swift
//  LearnSwiftUI
//
//  Created by MEGABEE on 16/7/25.
//

import SwiftUI
import ThemeKit

struct DisplayDataInList: View {
    let scrums: [DailyScrum]

    var body: some View {
        NavigationStack {
            List(scrums, id: \.title) { scrum in
                NavigationLink(destination: DetailView(scrum: scrum)) {
                    CardView(scrum: scrum)
                }.listRowBackground(scrum.theme.mainColor)
            }.navigationTitle("Daily Scrums")
        }
    }
}

#Preview {
    DisplayDataInList(scrums: DailyScrum.sampleData)
}
