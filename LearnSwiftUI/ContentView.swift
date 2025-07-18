import SwiftUI

enum CourseType: CaseIterable, Identifiable {
    case helloWorld
    case animationMorphingView
    case stackArrangeViews
    case displayDataInList

    var id: Self { self }

    var label: String {
        switch self {
        case .helloWorld:
            return "Hello, world!"
        case .animationMorphingView:
            return "Animation Morphing View"
        case .stackArrangeViews:
            return "Use Stacks Arrange Views"
        case .displayDataInList:
            return "Display Data In List"
        }
    }
}

struct ContentView: View {
    @State private var selectedCourse: CourseItem?
    @State private var scrums = DailyScrum.sampleData
    @State private var scrum = DailyScrum.emptyScrum

    @ViewBuilder
    private func destination(for type: CourseType) -> some View {
        switch type {
        case .helloWorld:
            AnyView(HelloWorldScreen())
        case .animationMorphingView:
            AnyView(MorphingView())
        case .stackArrangeViews:
            AnyView(StackArrangeViews(scrum: $scrum))
        case .displayDataInList:
            AnyView(DisplayDataInList(scrums: $scrums))
        }
    }

    var body: some View {
        NavigationStack {
            List(CourseType.allCases) { type in
                NavigationLink(destination: destination(for: type)) {
                    CourseRow(label: type.label)
                }
            }
            .navigationTitle("Courses")
        }
    }
}

#Preview {
    ContentView()
}
