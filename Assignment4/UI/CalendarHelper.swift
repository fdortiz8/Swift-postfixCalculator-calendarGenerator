//
//  CalendarHelper.swift
//  Assignment4
//
//  Created by Fernando Ortiz on 7/10/23.
//

import SwiftUI

struct CalendarHelper: View {
	@EnvironmentObject var dateHolder: DateHolder
	let count : Int
	let startingSpaces: Int
	let daysInMonth : Int
	let daysInPreviousMonth : Int
	
	var body: some View {
		Text(monthStruct().day())
			.foregroundColor(textColor(type: monthStruct().monthType))
			.frame(maxWidth: .infinity, maxHeight: .infinity)
	}
	
	func textColor(type: MonthType) -> Color {
		return type == MonthType.Current ? Color.black : Color.black
	}
	
	func monthStruct() -> MonthStruct {
		let start = startingSpaces
		if(count <= start) {
			let day = daysInPreviousMonth + count - start
			return MonthStruct(monthType: MonthType.Previous, dayInt: day)
		}
		else if (count - start > daysInMonth) {
			let day = count - start - daysInMonth
			return MonthStruct(monthType: MonthType.Next, dayInt: day)
		}
		let day = count - start
		return MonthStruct(monthType: MonthType.Current, dayInt: day)
	}
}

struct CalendarHelper_Previews: PreviewProvider {
	static var previews: some View {
		CalendarHelper(count: 1, startingSpaces: 1, daysInMonth: 1, daysInPreviousMonth: 1)
	}
}
