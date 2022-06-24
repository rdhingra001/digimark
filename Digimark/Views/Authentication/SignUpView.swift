//
//  SignUpView.swift
//  Digimark
//
//  Created by Ronit Dhingra on 6/24/22.
//

import SwiftUI

struct SignUpView: View {
    @State private var firstName: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        ZStack {
            Color("BackgroundColor").edgesIgnoringSafeArea(.all)
            VStack {
                VStack {
                    Text("Sign Up")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.bottom, 30)
                    SocialLoginButton(imageStr: "apple", title: "Sign up with Apple")
                    SocialLoginButton(imageStr: "google", title: "Sign up with Google")
                        .padding(.vertical)
                    Text("— or —")
                        .foregroundColor(.black.opacity(0.4))
                    TextField("First Name", text: $firstName)
                        .font(.title3)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.white)
                        .cornerRadius(50.0)
                        .shadow(color: .black.opacity(0.08), radius: 60, x: 0.0, y: 16)
                        .padding(.top)
                    TextField("Email", text: $email)
                        .font(.title3)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.white)
                        .cornerRadius(50.0)
                        .shadow(color: .black.opacity(0.08), radius: 60, x: 0.0, y: 16)
                        .padding(.top)
                    SecureField("Password", text: $password)
                        .font(.title3)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.white)
                        .cornerRadius(50.0)
                        .shadow(color: .black.opacity(0.08), radius: 60, x: 0.0, y: 16)
                        .padding(.vertical)
                    PrimaryButton(title: "Go!") {
                        print("sign up button pressed")
                    }
                }
                Spacer()
                Divider()
                Spacer()
                Text("Your data will not be used for any advertising purposes.")
                    .foregroundColor(.black.opacity(0.4))
                    .font(.caption)
                Spacer()
            }
            .padding()
            .frame(alignment: .top)
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
