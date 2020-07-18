//
//  BannerView.swift
//  FlexSchedule
//
//  Created by Philip Ng Pack on 7/15/20.
//  Copyright © 2020 Philip Ng Pack. All rights reserved.
//

import SwiftUI

// Welcome banner for TeacherPage and StudentPage
struct BannerView: View {
    @State private var studName: String = "Jerry"
    @State private var schoolName: String = "MILTON HIGH SCHOOL"
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 9, style: .continuous)
                .fill(Color.blue)
                .frame(width: UIScreen.main.bounds.size.width, height: 110)
                .shadow(radius: 1 , x: 2, y: 3)
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Welcome, \(studName)")
                    .font(.system(size: 20, weight: .bold, design: .default))
                    .foregroundColor(.white)
                Text("\(schoolName)")
                    .foregroundColor(.white)
            }
        }
    }
}

struct BannerView_Previews: PreviewProvider {
    static var previews: some View {
        BannerView()
    }
}

