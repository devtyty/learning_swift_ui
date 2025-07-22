//
//  NewScrumSheet.swift
//  LearnSwiftUI
//
//  Created by Megabee on 21/7/25.
//

import SwiftUI

struct NewScrumSheet: View {
    @State private var newScrum = DailyScrum.emptyScrum

    var body: some View {
        NavigationStack {
            DetailEditView(
                scrum: nil
            )
        }
    }
}

#Preview {
    NewScrumSheet()
}
