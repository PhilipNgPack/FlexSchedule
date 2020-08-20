//
//  CourseCards.swift
//  FlexSchedule
//
//  Created by Philip Ng Pack on 8/13/20.
//  Copyright © 2020 Philip Ng Pack. All rights reserved.
//

import SwiftUI

struct CourseCards: View {
    
    @State var courseArray: [AnyView] = []
    
    var body: some View {
        Text("hi")
//        VStack {
//            ForEach(0..<courseArray.count) { course in
//                courseArray[course]
//            }
        }
    }
    
    // this function should append to the array
    private func addCourse() {
    }

    // this function should remove a course from the array
    private func removeCourse() {
    }

    // this function should create course and return a courseCard view
    private func createCourseCard() -> AnyView {
        return VStack {
            Spacer()
            Text("Chemistry")
                .padding(10)
                .frame(minWidth: 0, maxWidth: 350)
                .background(Color.white)
        }
        .frame(height: 120)
        .background(Color.green)
        .cornerRadius(10)
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black.opacity(0.2), lineWidth: 1)) as! AnyView
    }
    
struct CourseCards_Previews: PreviewProvider {
    static var previews: some View {
        CourseCards()
    }
}
