//
//  BannerView.swift
//  FlexSchedule
//
//  Created by Philip Ng Pack on 7/15/20.
//  Copyright © 2020 Philip Ng Pack. All rights reserved.
//

import SwiftUI


// Welcome banner for TeacherPage and StudentPage
struct WelcomeBanner: View {
    @State var studName: String
    @State var schoolName: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.blue)
                .frame(width: UIScreen.main.bounds.size.width, height: 110)
                .shadow(radius: 1 , x: 2, y: 3)
            
            HStack(spacing: 40) {
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Welcome, \(studName)!")
                        .font(.system(size: 20, weight: .bold, design: .default))
                        .foregroundColor(.white)
                    Text("\(schoolName)")
                        .foregroundColor(.white)
                }
                
                UserBubble(profilePic: Image("Angus"))
            }
        }
        
    }
}

struct WelcomeBanner_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeBanner(studName: "Angus", schoolName: "MILTON HIGH SCHOOL")
    }
}

