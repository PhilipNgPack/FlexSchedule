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
    
    @State var email: String = ""
    @State var password: String = ""
    
    @State var storedName: String = ""
    @State var storedPass: String = ""
    @State var storedEmail: String = ""
    
    var body: some View {
        
        VStack {
            Text("MILTON HIGH SCHOOL")
                .font(.title)
            Image("School")
                .resizable()
                .frame(width: UIScreen.main.bounds.width, height: 300)
            
            VStack(alignment: .leading) {
            enterEmailField(email: self.$email)
            
            HStack{
            enterPassField(password: self.$password)
                
                Button(action: {
                if self.email == self.storedName && self.password == self.storedPass {
                    self.signInSuccess = true
                }
                self.showSignInMessage = true
                }) {
                    Image(systemName: "arrow.right.circle.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(Color.gray)
                }
            }
                
            }
            if self.showSignInMessage {
                if self.signInSuccess {
                    Text("Login successful")
                }
                else {
                    Text("Invalid user/pass")
                }
            }
            
            
            Button(action: {self.signUpDisplayed = true}) {
                signUpText()
            }.sheet(isPresented: $signUpDisplayed) {
                enterNameField(name: self.$storedName)
                enterEmailField(email: self.$storedEmail)
                enterPassField(password: self.$storedPass)
            }
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
        Text("Sign Up")
            .font(.headline)
            .foregroundColor(Color.white)
            .padding()
            .frame(width: 160, height: 50)
            .background(Color.green)
            .cornerRadius(15.0)
    }
}

struct enterEmailField: View {
    @Binding var email: String
    var body: some View {
        return TextField("Enter your email", text: self.$email)
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
        return SecureField("Enter your password", text: self.$password)
            .font(.headline)
            .foregroundColor(Color.white)
            .padding()
            .frame(width: 300, height: 40)
            .background(Color.gray)
            .cornerRadius(15.0)
    }
}


struct enterNameField: View {
    @Binding var name: String
    var body: some View {
        return TextField("Enter your name", text: self.$name)
            .font(.headline)
            .foregroundColor(Color.white)
            .padding()
            .frame(width: 300, height: 40)
            .background(Color.gray)
            .cornerRadius(15.0)
    }
}
