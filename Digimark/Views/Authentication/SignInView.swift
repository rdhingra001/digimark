//
//  SignInView.swift
//  Digimark
//
//  Created by Ronit Dhingra on 6/24/22.
//

import SwiftUI

struct SignInView: View {
    @Environment(\.colorScheme) var colorScheme
    
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
                            .foregroundColor(colorScheme == .light ? .black.opacity(0.4) : .white.opacity(0.7))
                        TextField("Email", text: $email)
                            .font(.title3)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color("SecondaryBackground"))
                            .cornerRadius(50.0)
                            .shadow(color: .black.opacity(0.08), radius: 60, x: 0.0, y: 16)
                            .padding(.top)
                        SecureField("Password", text: $password)
                            .font(.title3)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color("SecondaryBackground"))
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
                        .foregroundColor(colorScheme == .light ? .black.opacity(0.4) : .white.opacity(0.7))
                        .font(.caption)
                    Spacer()
                }
                .padding()
            }
        }
    }
}

struct SocialLoginButton: View {
    @Environment(\.colorScheme) var colorScheme
    
    var imageStr: String
    var title: String
    var body: some View {
        HStack {
            Image(uiImage: #imageLiteral(resourceName: imageStr))
                .resizable()
                //.frame(width: getRect().width/15, height: getRect().height/30)
                .frame(width: imageStr == "apple" && colorScheme == .light ? getRect().width / 17 : getRect().width / 15, height: getRect().height/30)
                .padding(.horizontal)
            Spacer()
            Text(title)
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color("SecondaryBackground"))
        .cornerRadius(50.0)
        .shadow(color: Color.black.opacity(0.08), radius: 60, x: 0.0, y: 16)
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
            
            
    }
}
