//
//  DisplayDataInList.swift
//  LearnSwiftUI
//
//  Created by MEGABEE on 16/7/25.
//

import SwiftUI
import ThemeKit

struct DisplayDataInList: View {
    let scrums: [DailyScrum]
    
    var body: some View {
        Text("Hello!")
        List(scrums, id: \.title) { scrum in
            CardView(scrum: scrum).listRowBackground(scrum.theme.mainColor)
        }
    }
}


#Preview {
    DisplayDataInList(scrums: DailyScrum.sampleData)
}
