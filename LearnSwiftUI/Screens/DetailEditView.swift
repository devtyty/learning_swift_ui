//
//  DetailEditView.swift
//  LearnSwiftUI
//
//  Created by MEGABEE on 17/7/25.
//

import SwiftData
import SwiftUI
import ThemeKit

struct DetailEditView: View {
    let scrum: DailyScrum

    @State private var attendeeName = ""
    @State private var title: String
    @State private var lengthInMinutesAsDouble: Double
    @State private var attendees: [Attendee]
    @State private var theme: Theme
    @State private var errorWrapper: ErrorWrapper?

    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context

    private var isCreatingScrum: Bool = false

    init(scrum: DailyScrum?) {
        let scrumToEdit: DailyScrum
        if let scrum {
            scrumToEdit = scrum
            isCreatingScrum = false
        } else {
            scrumToEdit = DailyScrum(
                title: "",
                attendees: [],
                lengthInMinutes: 5,
                theme: .sky
            )
            isCreatingScrum = true
        }

        self.scrum = scrumToEdit
        self.title = scrumToEdit.title
        self.lengthInMinutesAsDouble = scrumToEdit.lengthInMinitesAsDouble
        self.attendees = scrumToEdit.attendees
        self.theme = scrumToEdit.theme
    }

    var body: some View {
        Form {
            Section(header: Text("Meeting Info")) {
                TextField("Title", text: $title)
                HStack {
                    Slider(
                        value: $lengthInMinutesAsDouble,
                        in: 5...30,
                        step: 1
                    ) {
                        Text("Length")
                    }
                    Spacer()
                    Text("\(Int(lengthInMinutesAsDouble)) minutes")
                }
                ThemePicker(selection: $theme)
            }

            Section(header: Text("Attendee")) {
                ForEach(attendees) { attendee in
                    Text(attendee.name)
                }.onDelete { indices in
                    attendees.remove(atOffsets: indices)
                }
                HStack {
                    TextField("New Attendee", text: $attendeeName)
                    Button(action: {
                        withAnimation {
                            let attendee = Attendee(
                                name: attendeeName
                            )
                            attendees.append(attendee)
                            // reset attentdee name
                            attendeeName = ""
                        }
                    }) {
                        Image(systemName: "plus.circle.fill")
                    }.disabled(attendeeName.isEmpty)
                }
            }
        }.toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button("Cancel") {
                    dismiss()
                }
            }
            ToolbarItem(placement: .confirmationAction) {
                Button("Done") {
                    do {
                        try saveEdits()
                        dismiss()
                    } catch {
                        errorWrapper = ErrorWrapper(
                            error: error,
                            guidance:
                                "Daily scrum was not recorded. Try again later"
                        )
                    }
                }
            }
        }
        .sheet(item: $errorWrapper) {
            dismiss()
        } content: { wrapper in
            ErrorView(errorWrapper: wrapper)
        }
    }

    private func saveEdits() throws {
        scrum.title = title
        scrum.lengthInMinitesAsDouble = lengthInMinutesAsDouble
        scrum.attendees = attendees
        scrum.theme = theme

        if isCreatingScrum {
            context.insert(scrum)
        }

        try context.save()
    }
}

#Preview(traits: .dailyScrumsSampleData) {
    @Previewable @Query(sort: \DailyScrum.title) var scrums: [DailyScrum]

    DetailEditView(
        scrum: scrums[0]
    )
}
