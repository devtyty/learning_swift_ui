//
//  DailyScrum.swift
//  LearnSwiftUI
//
//  Created by MEGABEE on 16/7/25.
//

import Foundation
import ThemeKit

struct DailyScrum: Identifiable {
    let id: UUID
    
    var title: String
    var attendees: [Attendee]
    var lengthInMinutes: Int
    var lengthInMinitesAsDouble: Double {
        get {
            Double(lengthInMinutes)
        }
        set {
            lengthInMinutes = Int(newValue)
        }
    }
    var theme: Theme
    
    init(id: UUID = UUID(), title: String, attendees: [String], lengthInMinutes: Int, theme: Theme) {
        self.id = id
        self.title = title
        self.attendees = attendees.map({ Attendee(name: $0) })
        self.lengthInMinutes = lengthInMinutes
        self.theme = theme
    }
}


extension DailyScrum {
    struct Attendee: Identifiable {
        let id: UUID
        var name: String
        
        init(id: UUID = UUID(), name: String) {
            self.id = id
            self.name = name
        }
        
    }
    
    static var emptyScrum: DailyScrum {
        DailyScrum(title: "", attendees: [], lengthInMinutes: 0, theme: .sky)
    }
}
