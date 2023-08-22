//
//  MonthStruct.swift
//  Assignment4
//
//  Created by Fernando Ortiz on 7/9/23.
//

import Foundation
import SwiftUI

struct MonthStruct {
	var monthType: MonthType
	var dayInt: Int
	
	func day() -> String {
		return String(dayInt)
	}
}

enum MonthType {
	case Previous
	case Current
	case Next
}
