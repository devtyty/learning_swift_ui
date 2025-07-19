//
//  StackArrangeViews.swift
//  LearnSwiftUI
//
//  Created by MEGABEE on 13/7/25.
//

import SwiftUI

struct StackArrangeViews: View {
    @Binding var scrum: DailyScrum

    var body: some View {
        MeetingView(scrum: $scrum)
    }
}

private struct MeetingView: View {
    @Binding var scrum: DailyScrum

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16).fill(scrum.theme.mainColor)
            VStack {
                MeetingHeaderView(
                    secondsEslaped: 30,
                    secondsRemaining: 30,
                    theme: scrum.theme
                )
                Circle().strokeBorder(lineWidth: 20)
                HStack {
                    Text("Speaker 1 of 3")
                    Spacer()
                    Button(action: {}) {
                        Image(systemName: "forward.fill")
                    }
                }
            }
        }.padding()
            .foregroundColor(scrum.theme.accentColor)
            .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    @Previewable @State var scrum: DailyScrum = .emptyScrum

    StackArrangeViews(scrum: $scrum)
}

extension Text {
    public func test() -> Text {
        return self.font(.callout)
    }
}
