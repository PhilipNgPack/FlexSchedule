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
    static let weekFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM dd"
        return formatter
    }()
    
    enum SwipeDirection: String {
        case left, right
    }
    
    func detectSwipeDirection(value: DragGesture.Value) -> SwipeDirection {
        if value.startLocation.x < value.location.x {
            return .left
        } else {
            return .right
        }
    }
    
    /**
     * This method takes in a date and numDays to it.
     * usage: addDay(Monday, 1) -> Tuesday
     *
     * - parameter date: date you want to.
     * - parameter numDays: number of days.
     */
    func addDay(date: Date, numDays: Int) -> Date {
        return date.addingTimeInterval(86400 * Double(numDays))
    }

    /**
     - parameter addDays: the number of seconds to add onto the startDate (86400 seconds in one day * addDays)
     - returns: A new date that is addSeconds greater than the startDate
     */
    func displayDay(_ dayIndex: Int) -> Text {
        let newDate = addDay(date: self.startDate, numDays: dayIndex)
        return Text("\(newDate, formatter: Self.weekFormat)")
    }
    
    var body: some View {
            HStack{
                ForEach(0..<weekdays.count) { weekday in
                    VStack {
                        ZStack {
                            // Change rectangle to an image
                            RoundedRectangle(cornerRadius: 9, style: .continuous)
                                .stroke(Color.blue)
                                .frame(width: 68.5, height: 68.5)
                            self.displayDay(weekday)
                                .padding(.top, 30)
                            Text(self.weekdays[weekday])
                        }
                    }
                    
                }
            }.gesture(DragGesture().onEnded { value in
            let direction = self.detectSwipeDirection(value: value)
            if direction == .left {
                self.startDate = self.addDay(date: self.startDate, numDays: -7)
            }
            if direction == .right {
                self.startDate = self.addDay(date: self.startDate, numDays: 7)
            }
        })
        
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
