import Foundation

class CalendarGenerator {
		// Do not change the signature of this function,
		// replace the empty return with your implementation
	@Published var date = Date()
	let calendar = Calendar.current
	let dateFormatter = DateFormatter()
	
	func generate(yearAndMonth: DateComponents) -> [[Int]]  {
		let daysInCurrMonth = daysInMonth(date)
		let firstOfMonth = firstOfMonth(date)
		let startingSpaces = dayOfWeek(firstOfMonth)
		let prevMonth = minusMonth(date)
		let daysInPreviousMonth = daysInMonth(prevMonth)
		
		var calendarArray = [[Int]]()
		
		var currentRow = [Int]()
		
		var previousMonthDay = daysInPreviousMonth - startingSpaces + 1
		
		for _ in 1...startingSpaces {
			currentRow.append(previousMonthDay)
			previousMonthDay += 1
		}
		
		var currentMonthDay = 1
		while currentRow.count < 7 {
			currentRow.append(currentMonthDay)
			currentMonthDay += 1
		}
		
		calendarArray.append(currentRow)
		
		while (currentMonthDay <= daysInCurrMonth) {
			currentRow = [Int]()
			var n = 1
			for _ in 1...7 {
				if currentMonthDay <= daysInCurrMonth {
					currentRow.append(currentMonthDay)
					currentMonthDay += 1
				} else {
					currentRow.append(n)
					n += 1
				}
			}
			calendarArray.append(currentRow)
		}
		NSLog("contentsof newArray: %@", calendarArray)
		return calendarArray
		
	}
	
	// helper functions
	
	func monthYearString(_ date: Date) -> String {
		dateFormatter.dateFormat = "LLLL yyyy"
		return dateFormatter.string(from: date)
	}
	
	func currentMonth(_ date: Date) -> Date {
		let currentDate = Date()
		let calendar = Calendar.current
		let components = calendar.dateComponents([.year, .month], from: currentDate)
		return calendar.date(from: components)!
	}
	
	func plusMonth(_ date: Date) -> Date {
		return calendar.date(byAdding: .month, value: 1, to: date)!
	}
	
	func minusMonth(_ date: Date) -> Date {
		return calendar.date(byAdding: .month, value: -1, to: date)!
	}
	
	func daysInMonth(_ date: Date) -> Int {
		let range = calendar.range(of: .day, in: .month, for: date)!
		return range.count
	}
	
	func dayOfMonth(_ date: Date) ->Int {
		let components = calendar.dateComponents([.day], from: date)
		return components.day!
	}
	
	func firstOfMonth(_ date: Date) -> Date {
		let components = calendar.dateComponents([.year, .month], from: date)
		return calendar.date(from: components)!
	}
	
	func dayOfWeek(_ date: Date) -> Int {
		let components = calendar.dateComponents([.weekday], from: date)
		return components.weekday! - 1
	}
}

