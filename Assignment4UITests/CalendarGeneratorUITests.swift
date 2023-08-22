import XCTest

final class CalendarGeneratorUITests: XCTestCase {
	private var app: XCUIApplication!
	
	override func setUpWithError() throws {
		try super.setUpWithError()
		continueAfterFailure = true
		app = XCUIApplication()
		app.launch()
	}
	
//	private func checkCalendar(_ expected: String) throws {
//		let result = app.staticTexts[expected]
//		let calendarView = app.textFields["calendar"]
//		XCTAssert(result.exists)
//	}
//	
//	func testInitial() throws {
//		try checkCalendar("25 26 27 28 29 30 1\n2 3 4 5 6 7 8\n9 10 11 12 13 14 15\n16 17 18 19 20 21 22\n23 24 25 26 27 28 29\n30 31 1 2 3 4 5")
//	}
//  
}
