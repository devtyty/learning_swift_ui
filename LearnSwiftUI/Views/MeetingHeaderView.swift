//
//  MeetingHeaderView.swift
//  LearnSwiftUI
//
//  Created by MEGABEE on 18/7/25.
//

import SwiftUI
import ThemeKit
import TimerKit

struct MeetingHeaderView: View {
    let secondsEslaped: Int
    let secondsRemaining: Int
    let theme: Theme

    private var totalSeconds: Int {
        secondsEslaped + secondsRemaining
    }

    private var process: Double {
        guard totalSeconds > 0 else { return 1 }

        return Double(secondsEslaped) / Double(totalSeconds)
    }

    private var minutesRemaining: Int {
        totalSeconds / 60
    }

    var body: some View {
        VStack {
            ProgressView(value: 5, total: 15)
                .progressViewStyle(ScrumProgressViewStyle(theme: theme))
            HStack {
                VStack(alignment: .leading) {
                    Text("Second Elasped").font(.caption)
                    Label(
                        "\(secondsEslaped)",
                        systemImage: "hourglass.tophalf.fill"
                    )
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Second Elasped").font(.caption)
                    Label(
                        "\(secondsRemaining)",
                        systemImage: "hourglass.tophalf.fill"
                    )
                }
            }
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Time remaining")
        .accessibilityValue("10 minutes")
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    MeetingHeaderView(
        secondsEslaped: 60,
        secondsRemaining: 180,
        theme: .bubblegum
    )
}
