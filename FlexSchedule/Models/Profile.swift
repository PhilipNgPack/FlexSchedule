//
//  Profile.swift
//  FlexSchedule
//
//  Created by Philip Ng Pack on 8/7/20.
//  Copyright © 2020 Philip Ng Pack. All rights reserved.
//

import SwiftUI

struct Profile {

    var schoolName: String
    var userName: String
    var userPhoto: Image
    var userEmail: String
    var userPassword: String
    
    static let `default` = Self(schoolName: "MILTON HIGH SCHOOL", userName: "Angus", userPhoto: Image("Angus"), userEmail: "Angus@beef.com", userPassword: "Beef")

    init(schoolName: String, userName: String, userPhoto: Image, userEmail: String, userPassword: String) {
        self.schoolName = schoolName
        self.userName = userName
        self.userPhoto = userPhoto
        self.userEmail = userEmail
        self.userPassword = userPassword
    }
    
}
