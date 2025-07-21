//
//  StackArrangeViews.swift
//  LearnSwiftUI
//
//  Created by MEGABEE on 13/7/25.
//

import SwiftUI
import TimerKit
import AVFoundation

struct StackArrangeViews: View {
    @Binding var scrum: DailyScrum
    
    var body: some View {
        MeetingView(scrum: $scrum)
    }
}

private struct MeetingView: View {
    @Binding var scrum: DailyScrum
    @State var scrumTier = ScrumTimer()
    
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
            .onDisappear {
                scrumTier.stopScrum()
            }
            .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    @Previewable @State var scrum: DailyScrum = .emptyScrum
    
    StackArrangeViews(scrum: $scrum)
}
