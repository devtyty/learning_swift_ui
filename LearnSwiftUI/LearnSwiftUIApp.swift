//
//  LearnSwiftUIApp.swift
//  LearnSwiftUI
//
//  Created by MEGABEE on 12/7/25.
//

import SwiftUI

@main
struct LearnSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            ScrumdingerApp()
        }.modelContainer(for: DailyScrum.self)
    }
}
