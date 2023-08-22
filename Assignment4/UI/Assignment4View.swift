import SwiftUI
import Foundation


//https://www.youtube.com/watch?v=jBvkFKhnYLI&ab_channel=CodeWithCal
struct Assignment4View: View {
	@State private var expression: String = ""
	@State private var result: String = ""
	
	@EnvironmentObject var dateHolder: DateHolder
	
	private func evaluate() {
		do {
			result = try PostfixCalculator().parse(expression: expression).description
		} catch {
			result = "Error!"
		}
	}
	
	private func clearButton() {
		expression = ""
		result = ""
	}
	
	var body: some View {
		VStack {
			Label("Postfix Calculator", systemImage: "arrow.down.to.line.circle")
			TextField("Expression", text: $expression)
				.textFieldStyle(.roundedBorder)
			TextField("Result", text: $result)
				.disabled(true)
				.textFieldStyle(.roundedBorder)
			HStack {
				Button("Evaluate", action: evaluate)
				Button("Clear", action: clearButton)
			}
		}
		Spacer()
		Label("Calendar Generator", systemImage: "calendar")
		Month()
			.environmentObject(dateHolder)
		calendar
		HStack(){
			Button("Previous", action: previousMonth)
			Button("Today", action: currentMonth)
			Button("Next", action: nextMonth)
		}
		Spacer()
	}
	
	func previousMonth() {
		dateHolder.date = CalendarGenerator().minusMonth(dateHolder.date)
	}
	func currentMonth() {
		dateHolder.date = CalendarGenerator().currentMonth(dateHolder.date)
	}
	func nextMonth() {
		dateHolder.date = CalendarGenerator().plusMonth(dateHolder.date)
	}
	
	
	var calendar: some View {
		VStack(spacing: 1) {
			let daysInMonth = CalendarGenerator().daysInMonth(dateHolder.date)
			let firstDayOfMonth = CalendarGenerator().firstOfMonth(dateHolder.date)
			let startingSpaces = CalendarGenerator().dayOfWeek(firstDayOfMonth)
			let prevMonth = CalendarGenerator().minusMonth(dateHolder.date)
			let daysInPreviousMonth = CalendarGenerator().daysInMonth(prevMonth)
			let today = Date()
			let calendar = Calendar.current
			let dateComponents = calendar.dateComponents([.year, .month], from: today)
			let calArray = CalendarGenerator().generate(yearAndMonth: dateComponents)
			
			ForEach(0..<6) {
				row in
				HStack(spacing: 1) {
					ForEach(1..<8){
						column in
						let count = column + (row * 7)
						CalendarHelper(count: count, startingSpaces: startingSpaces, daysInMonth: daysInMonth, daysInPreviousMonth: daysInPreviousMonth)
							.environmentObject(dateHolder)
					}
				}
			}
		}
		.frame(maxWidth: 300, maxHeight: 200)
	}
}



#if !TESTING
struct Assignment4View_Previews: PreviewProvider {
	static var previews: some View {
		Assignment4View()
	}
}
#endif
