//
//  DailyScrum.swift
//  LearnSwiftUI
//
//  Created by MEGABEE on 16/7/25.
//

import ThemeKit

extension DailyScrum {
    static let sampleData: [DailyScrum] =
        [
            DailyScrum(
                title: "Design",
                attendees: ["Cathy", "Daisy", "Simon", "Jonathan"],
                lengthInMinutes: 10,
                theme: .yellow
            ),
            DailyScrum(
                title: "App Dev",
                attendees: ["Katie", "Gray", "Euna", "Luis", "Darla"],
                lengthInMinutes: 5,
                theme: .orange
            ),
            DailyScrum(
                title: "Web Dev",
                attendees: [
                    "Chella", "Chris", "Christina", "Eden", "Karla", "Lindsey",
                    "Aga", "Chad", "Jenn", "Sarah",
                ],
                lengthInMinutes: 5,
                theme: .poppy
            ),
        ]
}
