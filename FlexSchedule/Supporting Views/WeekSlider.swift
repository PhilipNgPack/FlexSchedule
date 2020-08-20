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
        formatter.dateFormat = "MMM dd"
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
     * - parameter date: the beginning date that will have time added or subtracted from it
     * - parameter numDays: the number of days added onto date
     * - returns: A new date that is numDays greater or fewer than the startDate
     */
    func addDay(date: Date, numDays: Int) -> Date {
        return date.addingTimeInterval(86400 * Double(numDays))
    }
    
    func displayVStack() -> some View {
        return ForEach(0..<weekdays.count) { weekday in
            VStack {
                ZStack {
                    // Change rectangle to an image
                    RoundedRectangle(cornerRadius: 9, style: .continuous)
                        .stroke(Color.blue)
                        .frame(width: 68.5, height: 68.5)
                    Text("\(self.addDay(date: self.startDate, numDays: weekday), formatter: Self.weekFormat)")
                        .font(.system(size: 15))
                        .padding(.bottom, 45)
                    Text(self.weekdays[weekday])
                        .font(.system(size: 15))
                        .padding(.top, 45)
                }
            }
            
        }
    }
    
    var body: some View {
        
        HStack{
            displayVStack()
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
     - parameter weekday: the day of the week that we are searching for
     - parameter direction: going forwards in time or backwards in time from the date that weekday
     - returns: a Date that matches both parameters
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
