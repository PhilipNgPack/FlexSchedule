//
//  UserBubbleView.swift
//  FlexSchedule
//
//  Created by Philip Ng Pack on 7/27/20.
//  Copyright © 2020 Philip Ng Pack. All rights reserved.
//

import SwiftUI

struct UserBubble: View {

    var profilePic: Image
    
    var body: some View {
        profilePic
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 60, height: 60)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 5)
    }
}

struct UserBubble_Previews: PreviewProvider {
    static var previews: some View {
        UserBubble(profilePic: Image("Angus"))
    }
}
