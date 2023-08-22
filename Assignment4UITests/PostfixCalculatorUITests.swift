import XCTest

final class PostfixCaculatorUITests: XCTestCase {
	private var app: XCUIApplication!
	
	override func setUpWithError() throws {
		try super.setUpWithError()
		continueAfterFailure = true
		app = XCUIApplication()
		app.launch()
	}
	
	private func evaluate(_ expression: String, _ expected: String) throws {
		let field = app.textFields["Expression"]
		field.tap()
		field.typeText(expression)
		app.buttons["Evaluate"].tap()
		let result = app.textFields["Result"]
		XCTAssertEqual(result.value as! String, expected.description, "Incorrect")
	}
	
	func testValidExpression() throws {
		try evaluate("2 3.2 +", "5.2")
	}
	
	func testInvalidExpression() throws {
		try evaluate("2 3.2 !", "Error!")
	}
	
	private func clearExpression(_ expression: String, _ expected: String) throws {
		let field = app.textFields["Expression"]
		field.tap()
		field.typeText(expression)
		app.buttons["Evaluate"].tap()
		app.buttons["Clear"].tap()
		
		XCTAssertEqual(field.value as! String, expected.description, "Incorrect")
	}
	
	func testClearExpression() throws {
		try clearExpression("2 3.2 +", "Expression")
	}
	
	private func clearResult(_ expression: String, _ expected: String) throws {
		let field = app.textFields["Expression"]
		field.tap()
		field.typeText(expression)
		app.buttons["Evaluate"].tap()
		app.buttons["Clear"].tap()
		let result = app.textFields["Result"]
		
		XCTAssertEqual(result.value as! String, expected.description, "Incorrect")
	}
	
	func testClearResult() throws {
		try clearResult("2 3 *", "Result")
	}
	
}
