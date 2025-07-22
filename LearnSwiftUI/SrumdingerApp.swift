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
            return "Meeting View"
        case .displayDataInList:
            return "ScrumViews"
        }
    }
}

struct ScrumdingerApp: View {
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
            AnyView(MeetingView(scrum: scrum, errorWrapper: .constant(nil)))
        case .displayDataInList:
            AnyView(ScrumViews())
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
    ScrumdingerApp()
}
