//
//  UserData.swift
//  FlexSchedule
//
//  Created by Philip Ng Pack on 8/4/20.
//  Copyright © 2020 Philip Ng Pack. All rights reserved.
//

import SwiftUI

class UserData: ObservableObject {
    @Published var profile: Profile = Profile.default
}
