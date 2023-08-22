import XCTest
@testable import Assignment4

final class PostfixCalculatorTests: XCTestCase {
	func evaluate(_ expression: String, _ expected: Double) throws {
		let raw = try PostfixCalculator().parse(expression: expression)
		let result = (round(raw * 10000.0) / 10000.0)
		XCTAssertEqual(expected, result)
	}
	
	func testAddition() throws {
		try evaluate("2.2 1.1 +", 3.3)
	}
	
	func testLongAddition() throws {
		try evaluate("2.2222 1.6789 +", 3.9011)
	}
	
	func testSubtraction() throws {
		try evaluate("6.3 4.1 -", 2.2)
	}
	
	func testLongSubtraction() throws {
		try evaluate("8.5432 3.6789 -", 4.8643)
	}
	
	func testMultiplication() throws {
		try evaluate("5 4 *", 20.0)
	}
	
	func testLongMultiplication() throws {
		try evaluate("3.67 6.23 *", 22.8641)
	}
	
	func testDivision() throws {
		try evaluate("28 4 /", 7)
	}
	
	func testLongDivision() throws {
		try evaluate("18.86 6.33 /", 2.9795)
	}
	
	func testPower() throws {
		try evaluate("3 4 ^", 81)
	}
	
	func testLongPower() throws {
		try evaluate("3.27 3 ^", 34.9658)
	}
	
	func testHomeworkQuestion() throws {
		try evaluate("5 6 2 ^ 2 - *", 170.0)
	}
	
	func testUnknownOperator() throws {
		do {
			let _ = try PostfixCalculator().parse(expression: "1 1 !")
			XCTFail("Expecting Error")
		} catch PostfixCalculatorError.invalidOperator {
		}
	}
	
	func testInvalidExpression() throws {
		do {
			let _ = try PostfixCalculator().parse(expression: "2 3")
			XCTFail("Expecting error")
		} catch PostfixCalculatorError.invalidExpression {
		}
	}
  
}
