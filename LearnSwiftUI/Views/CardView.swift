import SwiftUI

struct CardView: View {

    let scrum: DailyScrum

    var body: some View {
        VStack(alignment: .leading) {
            Text(scrum.title).font(.headline)
            Spacer()
            HStack {
                Label("\(scrum.attendees.count)", systemImage: "person.3")
                Label("\(scrum.lengthInMinutes)", systemImage: "clock")
            }.font(.caption)
        }.padding().foregroundColor(scrum.theme.accentColor)
    }
}

#Preview(traits: .fixedLayout(width: 400, height: 100)) {
    let scrum = DailyScrum.sampleData[0]

    CardView(scrum: scrum).background(scrum.theme.mainColor)
}
