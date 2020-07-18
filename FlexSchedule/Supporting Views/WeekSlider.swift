//
//  WeekSlider.swift
//  FlexSchedule
//
//  Created by Philip Ng Pack on 7/16/20.
//  Copyright © 2020 Philip Ng Pack. All rights reserved.
//

import SwiftUI

struct WeekSlider: View {
    
    var date = Date()
    
    static let weekFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM dd"
        return formatter
    }()
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack{
                VStack(alignment: .leading) {
                    Text("\(date, formatter: Self.weekFormat) - \(date, formatter: Self.weekFormat)")
                }.frame(width: UIScreen.main.bounds.size.width, height: 100)
                    .background(Color.red)
            }
        }
    }
}
struct WeekSlider_Previews: PreviewProvider {
    static var previews: some View {
        WeekSlider()
    }
}
