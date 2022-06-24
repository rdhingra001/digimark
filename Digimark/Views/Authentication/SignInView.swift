//
//  SignInView.swift
//  Digimark
//
//  Created by Ronit Dhingra on 6/24/22.
//

import SwiftUI

struct SignInView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        ZStack {
            ZStack {
                Color("BackgroundColor").edgesIgnoringSafeArea(.all)
                VStack {
                    VStack {
                        Text("Sign In")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .padding(.bottom, 30)
                        SocialLoginButton(imageStr: "apple", title: "Sign in with Apple")
                        SocialLoginButton(imageStr: "google", title: "Sign in with Google")
                            .padding(.vertical)
                        Text("— or —")
                            .foregroundColor(.black.opacity(0.4))
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
                            print("sign in button pressed")
                        }
                    }
                    .frame(alignment: .top)
                    Spacer()
                    Divider()
                    Spacer()
                    Text("Your data will not be used for any advertising purposes.")
                        .foregroundColor(.black.opacity(0.4))
                        .font(.caption)
                    Spacer()
                }
                .padding()
            }
        }
    }
}

struct SocialLoginButton: View {
    var imageStr: String
    var title: String
    var body: some View {
        HStack {
            Image(uiImage: #imageLiteral(resourceName: imageStr))
                .padding(.horizontal)
            Spacer()
            Text(title)
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(50.0)
        .shadow(color: Color.black.opacity(0.08), radius: 60, x: 0.0, y: 16)
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
