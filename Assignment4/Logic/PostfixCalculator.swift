import Foundation
class PostfixCalculator {
  // Do not change the signature of this function,
  // replace the error throw with your implementation
	func parse(expression: String) throws -> Double {
		let input = expression.components(separatedBy: " ")
		
		var numArr = [Double]()
		
		for val in input [0..<input.count] {
			switch (val) {
			case "+":
				numArr.append(numArr.removeLast() + numArr.removeLast())
			case "-":
				let temp = numArr.removeLast()
				numArr.append(numArr.removeLast() - temp)
			case "*":
				numArr.append(numArr.removeLast() * numArr.removeLast())
			case "/":
				let temp = numArr.removeLast()
				numArr.append(numArr.removeLast() / temp)
			case "^":
				let temp = numArr.removeLast()
				numArr.append(pow(numArr.removeLast(), temp))
			default:
				if let currNum = Double(val) {
					numArr.append(currNum)
				} else {
					throw PostfixCalculatorError.invalidOperator("Invalid operator")
				}
			}
		}
		if (numArr.count > 1) {
			throw PostfixCalculatorError.invalidExpression("Invalid Expression")
		}
		return numArr[0]
	}
}
