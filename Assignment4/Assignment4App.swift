import SwiftUI

@main
struct Assignment4App: App {
    var body: some Scene {
        WindowGroup {
			let calendarGenerator = DateHolder()
            Assignment4View()
				.environmentObject(calendarGenerator)
        }
    }
}
