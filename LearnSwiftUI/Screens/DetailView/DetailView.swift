//
//  DetailView.swift
//  LearnSwiftUI
//
//  Created by MEGABEE on 17/7/25.
//

import SwiftUI

struct DetailView: View {
    @Binding var scrum: DailyScrum

    @State private var editingScrum: DailyScrum = .emptyScrum

    @State private var isPresentingEditView = false
    
    var body: some View {
        List {
            Section(header: Text("Meeting Info")) {
                NavigationLink(destination: StackArrangeViews(scrum: $scrum)) {
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
            Section(header: Text("History")) {
                if scrum.history.isEmpty {
                    Label("No meetings yet", systemImage: "calendar.badge.exclamationmark")
                }
                
                ForEach(scrum.history) { history in
                    HStack {
                        Image(systemName: "calendar")
                        Text(history.date, style: .date)
                    }
                }
            }
        }.navigationTitle(scrum.title)
            .toolbar {
                Button("Edit") {
                    isPresentingEditView = true
                }
            }
            .sheet(isPresented: $isPresentingEditView) {
                NavigationStack {
                    DetailEditView(
                        scrum: $editingScrum,
                        saveEdits: { _ in
                            scrum = editingScrum
                        }
                    )
                    .navigationTitle(
                        scrum.title
                    )
                }
            }
    }
}

#Preview {
    @Previewable @State var scrum: DailyScrum = .sampleData[0]

    NavigationStack {
        DetailView(scrum: $scrum)
    }
}
