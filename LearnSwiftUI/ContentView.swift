import SwiftUI

struct ContentView: View {
    @State private var selectedCourse: CourseItem?
    
    private let courses: [CourseItem] = [
        CourseItem(label: "Hello, world!", destination: AnyView(HelloWorldScreen())),
        CourseItem(label: "Animation Morphing View", destination: AnyView(MorphingView())),
        CourseItem(label: "Use Stacks Arrange Views", destination: AnyView(StackArrangeViews())),
        CourseItem(label: "Display Data In List", destination: AnyView(DisplayDataInList(scrums: DailyScrum.sampleData))),
    ]
    
    var body: some View {
        NavigationStack {
            List(courses) { course in
                NavigationLink(value: course) {
                    CourseRow(label: course.label)
                }
            }
            .navigationDestination(for: CourseItem.self) { course in
                course.destination
            }
            .navigationTitle("Courses")
        }
    }
}

#Preview {
    ContentView()
}
