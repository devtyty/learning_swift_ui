//
//  MeetingFooterView.swift
//  LearnSwiftUI
//
//  Created by Megabee on 21/7/25.
//

import SwiftUI
import TimerKit

struct MeetingFooterView: View {
    let speakers: [ScrumTimer.Speaker]
    var skipAction: () -> Void

    private var speakerNumber: Int? {
        guard let index = speakers.firstIndex(where: { !$0.isCompleted }) else {
            return nil
        }

        return index + 1
    }

    private var isLastSpeaker: Bool {
        return speakers.dropLast().allSatisfy({ $0.isCompleted })
    }

    private var speakerText: String {
        guard let speakerNumber = speakerNumber else {
            return "No more speaker!"
        }

        return "\(speakerNumber) of \(speakers.count)"
    }

    var body: some View {
        VStack {
            HStack {
                if isLastSpeaker {
                    Text("Last Speaker")
                } else {
                    Text(speakerText)
                    Spacer()
                    Button(action: skipAction) {
                        Image(systemName: "forward.fill")
                    }
                }
            }
        }.padding([.bottom, .horizontal])
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    @Previewable var speakers = DailyScrum.sampleData.first!.attendees.map {
        $0.name
    }
    .map { ScrumTimer.Speaker(name: $0, isCompleted: false) }

    MeetingFooterView(speakers: speakers, skipAction: {})
}
