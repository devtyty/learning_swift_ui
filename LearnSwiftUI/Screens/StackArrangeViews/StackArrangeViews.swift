//
//  StackArrangeViews.swift
//  LearnSwiftUI
//
//  Created by MEGABEE on 13/7/25.
//

import SwiftUI

struct StackArrangeViews: View {
    var body: some View {
        MeetingView()
    }
}

private struct MeetingView: View {
    var body: some View {
        VStack {
            ProgressView(value: 0.4, total: 1)
            HStack {
                VStack(alignment: .leading) {
                    Text("Second Elasped").font(.caption)
                    Label("300", systemImage: "hourglass.tophalf.fill")
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Second Elasped").font(.caption)
                    Label("600", systemImage: "hourglass.tophalf.fill")
                }
            }
            Circle().strokeBorder(lineWidth: 20)
            HStack {
                Text("Speaker 1 of 3")
                Spacer()
                Button(action: {}) {
                    Image(systemName: "forward.fill")
                }
            }
        }.padding(.horizontal, 16)

    }
}

#Preview {
    StackArrangeViews()
}

extension Text {
    public func test() -> Text {
        return self.font(.callout)
    }
}
