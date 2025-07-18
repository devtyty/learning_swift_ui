//
//  DetailEditView.swift
//  LearnSwiftUI
//
//  Created by MEGABEE on 17/7/25.
//

import SwiftUI

struct DetailEditView: View {

    @State private var scrum = DailyScrum.emptyScrum
    @State private var attendeeName = ""

    var body: some View {
        Form {
            Section(header: Text("Meeting Info")) {
                TextField("Title", text: $scrum.title)
                HStack {
                    Slider(
                        value: $scrum.lengthInMinitesAsDouble,
                        in: 5...30,
                        step: 1
                    ) {
                        Text("Length")
                    }
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                }
            }

            Section(header: Text("Attendee")) {
                ForEach(scrum.attendees) { attendee in
                    Text(attendee.name)
                }.onDelete { indices in
                    scrum.attendees.remove(atOffsets: indices)
                }
                HStack {
                    TextField("New Attendee", text: $attendeeName)
                    Button(action: {
                        withAnimation {
                            let attendee = DailyScrum.Attendee(
                                name: attendeeName
                            )
                            scrum.attendees.append(attendee)

                            // reset attentdee name
                            attendeeName = ""
                        }
                    }) {
                        Image(systemName: "plus.circle.fill")
                    }.disabled(attendeeName.isEmpty)
                }
            }
        }
    }
}

#Preview {
    DetailEditView()
}
