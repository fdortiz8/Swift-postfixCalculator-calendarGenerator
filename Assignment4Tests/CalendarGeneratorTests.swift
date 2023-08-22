import XCTest
@testable import Assignment4

// https://talk.objc.io/episodes/S01E78-swift-strings-and-substrings
final class CalendarGeneratorTests: XCTestCase {
	
	func generateCalendar(_ expression: DateComponents, _ expected: String) throws {
		let raw = CalendarGenerator().generate(yearAndMonth : expression)
		
		let result = raw.map { row in
			row.map(String.init).joined(separator: " ")
		}.joined(separator: "\n")
		XCTAssertEqual(result, expected)
	}
	
	func testCurrentDate() throws {
		let today = Date()
		let calendar = Calendar.current
		let dateComponents = calendar.dateComponents([.year, .month], from: today)
		let toTest = "25 26 27 28 29 30 1\n2 3 4 5 6 7 8\n9 10 11 12 13 14 15\n16 17 18 19 20 21 22\n23 24 25 26 27 28 29\n30 31 1 2 3 4 5"
		try generateCalendar(dateComponents, toTest)
	}
}
