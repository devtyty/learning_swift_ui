//
//  StackArrangeViews.swift
//  LearnSwiftUI
//
//  Created by MEGABEE on 13/7/25.
//

import AVFoundation
import SwiftUI
import TimerKit

struct MeetingView: View {
    let scrum: DailyScrum

    @Environment(\.modelContext) private var context
    @State var scrumTier = ScrumTimer()
    @Binding var errorWrapper: ErrorWrapper?

    private let player = AVPlayer.dingPlayer()

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16).fill(scrum.theme.mainColor)
            VStack {
                MeetingHeaderView(
                    secondsEslaped: scrumTier.secondsElapsed,
                    secondsRemaining: scrumTier.secondsRemaining,
                    theme: scrum.theme
                )
                Circle().strokeBorder(lineWidth: 20)
                MeetingFooterView(
                    speakers: scrumTier.speakers,
                    skipAction: scrumTier.skipSpeaker
                )
            }
        }.padding()
            .foregroundColor(scrum.theme.accentColor)
            .onAppear {
                startScrum()
            }
            .onDisappear {
                do {
                    try endScrum()
                } catch {
                    errorWrapper = ErrorWrapper(
                        error: error,
                        guidance:
                            "Meeting time was not recorded. Try again later."
                    )
                }
            }
            .navigationBarTitleDisplayMode(.inline)
    }

    private func startScrum() {
        scrumTier.reset(
            lengthInMinutes: scrum.lengthInMinutes,
            attendeeNames: scrum.attendees.map({ $0.name })
        )
        scrumTier.startScrum()
        scrumTier.speakerChangedAction = {
            player.seek(to: .zero)
            player.play()
        }
    }

    private func endScrum() throws {
        scrumTier.stopScrum()
        let newHistory = History(attendees: scrum.attendees)
        scrum.history.insert(newHistory, at: 0)
        try context.save()
    }
}

#Preview {
    @Previewable @State var scrum: DailyScrum = .emptyScrum

    MeetingView(scrum: scrum, errorWrapper: .constant(nil))
}
