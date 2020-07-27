//
//  StudentPage.swift
//  FlexSchedule
//
//  Created by Philip Ng Pack on 7/10/20.
//  Copyright © 2020 Philip Ng Pack. All rights reserved.
//

import SwiftUI

struct StudentPage: View {
    
    var body: some View {
        
        VStack{
            WeekSlider()
        }
    }
}



struct StudentPage_Previews: PreviewProvider {
    static var previews: some View {
        StudentPage()
    }
}
