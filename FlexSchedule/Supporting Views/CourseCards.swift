//
//  CourseCards.swift
//  FlexSchedule
//
//  Created by Philip Ng Pack on 8/13/20.
//  Copyright © 2020 Philip Ng Pack. All rights reserved.
//

import SwiftUI

struct CourseCards: View {
    var body: some View {
        VStack {
            Spacer()
            Text("Chemistry")
                .padding(10)
                .frame(minWidth: 0, maxWidth: 350)
                .background(Color.white)
        }
        .frame(height: 120)
        .background(Color.green)
        .cornerRadius(10)
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black.opacity(0.2), lineWidth: 1))
    }
}


struct CourseCards_Previews: PreviewProvider {
    static var previews: some View {
        CourseCards()
    }
}
