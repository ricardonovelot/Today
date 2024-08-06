//
//  Date+Today.swift
//  Today
//
//  Created by Ricardo on 06/08/24.
//

import Foundation

extension Date{
    var dayAndTimeText: String{
        let timeText = formatted(date: .omitted, time: .shortened)
        if Locale.current.calendar.isDateInToday(self){
            let timeFormat = NSLocalizedString("Today at %@", comment: "Today at time format string")
            return String(format: timeFormat, timeText)
        } else{
            let dateText = formatted(.dateTime.month(.abbreviated).day())
            let dateandTimeFormat = NSLocalizedString("%@ at %@", comment: "Date and time format string")
            return String(format: dateandTimeFormat, dateText, timeText)
        }
    }
    
    
    var dayText: String{
        _ = formatted(date: .abbreviated, time: .omitted)
        if Locale.current.calendar.isDateInToday(self){
            return String(NSLocalizedString("Today", comment: "Today due date"))
        } else {
            let notTodayDate = formatted(.dateTime.month().day().weekday(.wide))
            return String(notTodayDate)
        }
    }
}
