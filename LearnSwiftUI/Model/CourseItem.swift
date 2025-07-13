import SwiftUI

struct CourseItem: Identifiable, Hashable {
    let id = UUID()
    let label: String
    let destination: AnyView

    static func == (lhs: CourseItem, rhs: CourseItem) -> Bool {
        lhs.label == rhs.label
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(label)
    }
}
