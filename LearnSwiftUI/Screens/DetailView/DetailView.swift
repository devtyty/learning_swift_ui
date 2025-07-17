//
//  DetailView.swift
//  LearnSwiftUI
//
//  Created by MEGABEE on 17/7/25.
//

import SwiftUI

struct DetailView: View {

    let scrum: DailyScrum

    var body: some View {
        List {
            Section(header: Text("Meeting Info")) {
                NavigationLink(destination: StackArrangeViews()) {
                    Label("Start Meeting", systemImage: "timer").font(.headline)
                        .foregroundColor(.accentColor)
                }
                HStack {
                    Label("Length", systemImage: "clock")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                }

                HStack {
                    Label("Theme", systemImage: "paintpalette")

                    Spacer()

                    Text(scrum.theme.name).padding(4).background(
                        scrum.theme.mainColor
                    ).cornerRadius(4)
                }
            }
            
            Section(header: Text("Attendees")) {
                ForEach(scrum.attendees) { attendee in
                    Label(attendee.name, systemImage: "person")
                }
            }
        }.navigationTitle(scrum.title)
    }
}

#Preview {
    NavigationStack {
        DetailView(scrum: DailyScrum.sampleData[0])
    }
}
