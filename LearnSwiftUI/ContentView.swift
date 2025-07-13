//
//  ContentView.swift
//  LearnSwiftUI
//
//  Created by MEGABEE on 12/7/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationSplitView {
            List {
                NavigationLink {
                    HelloWorldScreen()
                } label: {
                    CourseRow(label: "Hello, world!")
                }
            }.navigationTitle("Courses")
        } detail: {
            Text("Select a course!")
        }
    }
}

#Preview {
    ContentView()
}
