//
//  MonthView.swift
//  Assignment4
//
//  Created by Fernando Ortiz on 7/8/23.
//

import Foundation
import SwiftUI


struct Month: View {
	@EnvironmentObject var dateHolder: DateHolder
	
    var body: some View {
		HStack{
			Spacer()
			Text(CalendarGenerator().monthYearString(dateHolder.date))
				.font(.title)
				.bold()
				.animation(.none)
				.frame(maxWidth: .infinity)
			Spacer()
		}
    }
}

struct Month_Previews: PreviewProvider {
    static var previews: some View {
        Month()
    }
}
