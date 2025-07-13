//
//  ContentView.swift
//  LearnSwiftUI
//
//  Created by MEGABEE on 12/7/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            List {
                CourseRow(label: "Hello, world!")
            }
        }
    }
}

#Preview {
    ContentView()
}
