//
//  RegistrationView.swift
//  Threads
//
//  Created by Abdulmajit Kubatbekov on 7/2/24.
//

import SwiftUI

struct RegistrationView: View {
    
    @State private var email = ""
    @State private var password = ""
    @State private var fullName = ""
    @State private var username = ""

    var body: some View {

        VStack {
            Spacer()
            
            Image("icon")
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .padding()
            
            VStack {
                TextField("Enter your email", text: $email)
                    .autocapitalization(.none)
                    .modifier(ThreadsTextFieldModifier())
                
                TextField("Enter your password", text: $password)
                    .modifier(ThreadsTextFieldModifier())
                
                TextField("Enter your full name", text: $fullName)
                    .modifier(ThreadsTextFieldModifier())
                
                TextField("Enter your username", text: $username)
                    .modifier(ThreadsTextFieldModifier())
            }

            Button {
                
            } label: {
                Text("Sign Up")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(width: 352, height: 44)
                    .background(.black)
                    .cornerRadius(8)
            }
            .padding(.vertical)
            
            Spacer()
            
            Divider()
            
            Button {

            } label: {
                HStack(spacing: 5) {
                    Text("Already have an account?")
                    
                    Text("Sign In")
                        .fontWeight(.semibold)
                }
                .foregroundColor(.black)
                .font(.footnote)
            }
            .padding(.vertical, 16)
        }
    }
}

#Preview {
    RegistrationView()
}
