//
//  WeekSlider.swift
//  FlexSchedule
//
//  Created by Philip Ng Pack on 7/16/20.
//  Copyright © 2020 Philip Ng Pack. All rights reserved.
//

import SwiftUI

struct WeekSlider: View {
    
    let weekdays: [String] = ["Mon", "Tues", "Wed", "Thurs", "Fri"]
    @State var startDate: Date = Date().next(.monday, direction: .backward)

    /**
     - parameter addDays: the number of seconds to add onto the startDate (86400 seconds in one day * addDays)
     - returns: A new date that is addSeconds greater than the startDate
     */
    func addDay(_ dayIndex: Double) -> Text {
        let newDate = startDate.addingTimeInterval(86400 * dayIndex)
        return Text("\(newDate, formatter: Self.weekFormat)")
    }
    
    static let weekFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM dd"
        return formatter
    }()
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack{
                ForEach(0..<weekdays.count) { weekday in
                    VStack{
                        RoundedRectangle(cornerRadius: 9, style: .continuous)
                            .stroke(Color.blue)
                            .frame(width: 68.5, height: 68.5)
                        self.addDay(Double(weekday))
                        
                        Text(self.weekdays[weekday])
                    }
                    
                }
            }
        }
        
    }
}

struct WeekSlider_Previews: PreviewProvider {
    static var previews: some View {
        WeekSlider()
    }
}

extension Date {
    /**
     - parameter weekday:
    */
    public func next(_ weekday: Weekday, direction: Calendar.SearchDirection = .forward) -> Date
    {
        let calendar = Calendar(identifier: .gregorian)
        let components = DateComponents(weekday: weekday.rawValue)
        
        if calendar.component(.weekday, from: self) == weekday.rawValue
        {
            return self
        }
        
        return calendar.nextDate(after: self,
                                 matching: components,
                                 matchingPolicy: .nextTime,
                                 direction: direction)!
    }
    
    public enum Weekday: Int {
        case sunday = 1, monday, tuesday, wednesday, thursday, friday, saturday
    }
}
