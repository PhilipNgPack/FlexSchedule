//
//  UserStartPage.swift
//  FlexSchedule
//
//  Created by Philip Ng Pack on 7/31/20.
//  Copyright © 2020 Philip Ng Pack. All rights reserved.
//

import SwiftUI

struct UserStartPage: View {
    
    @State var signUpDisplayed: Bool = false
    
   
    @State var signInSuccess: Bool = false
    @State var showSignInMessage: Bool = false
    
    @State var name: String = ""
    @State var password: String = ""
    
    var storedName: String = "Angus"
    var storedPass: String = "Beef"
    var storedEmail: String = "@@@"
    
    var body: some View {
        
//        VStack(alignment: .leading) {
//            enterNameField(name: self.$name)
//            enterPassField(password: self.$password)
//
//            Button("Sign In", action: {
//                if self.name == self.storedName && self.password == self.storedPass {
//                    self.signInSuccess = true
//                }
//                self.showSignInMessage = true
//            })
//
//            if self.showSignInMessage {
//                if self.signInSuccess {
//                        Text("Login sucessful")
//                }
//                else {
//                    Text("Invalid user/pass")
//                }
//            }
//        }
        
                Button(action: {self.signUpDisplayed = true}) {
                    signUpText()
                }.sheet(isPresented: $signUpDisplayed) {
                    Text("here")
                }
        
    }
}

struct UserStartPage_Previews: PreviewProvider {
    static var previews: some View {
        UserStartPage()
    }
}

struct signUpText: View {
    var body: some View {
        Text("Login")
            .font(.headline)
            .foregroundColor(Color.white)
            .padding()
            .frame(width: 220, height: 60)
            .background(Color.green)
            .cornerRadius(15.0)
    }
}

struct enterNameField: View {
    @Binding var name: String
    var body: some View {
        return TextField("enter your name", text: self.$name)
            .font(.headline)
            .foregroundColor(Color.white)
            .padding()
            .frame(width: 300, height: 40)
            .background(Color.gray)
            .cornerRadius(15.0)
    }
}

struct enterPassField: View {
    @Binding var password: String
    var body: some View {
        return SecureField("enter your password", text: self.$password)
            .font(.headline)
            .foregroundColor(Color.white)
            .padding()
            .frame(width: 300, height: 40)
            .background(Color.gray)
            .cornerRadius(15.0)
    }
}

