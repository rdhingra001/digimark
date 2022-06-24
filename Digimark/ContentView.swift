//
//  ContentView.swift
//  Digimark
//
//  Created by Ronit Dhingra on 6/23/22.
//

import SwiftUI
import AuthenticationServices

struct ContentView: View {
    @State var email: String = ""
    @State var password: String = ""
    
    @AppStorage("email") var storedEmail: String = ""
    @AppStorage("firstName") var firstName: String = ""
    @AppStorage("userId") var userId: String = ""
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack {
            WelcomeView()
            TextField("Email", text: $email)
                .padding()
                .background(Constants.getGrey(scheme: colorScheme))
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            SecureField("Password", text: $password)
                .padding()
                .background(Constants.getGrey(scheme: colorScheme))
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            Button {
                print("tapped")
            } label: {
                Text("Sign In / Sign Up")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 175, height: 40)
                    .background(Color.accentColor)
                    .cornerRadius(20.0)
            }
            .padding(.bottom, 15)
            Text("— or —")
                .font(.system(.body))
                .foregroundColor(Constants.getGreyInvert(scheme: colorScheme))
                .padding(.bottom, 15)
            SignInWithAppleButton(.continue) { (request) in
                
            } onCompletion: { (result) in
                switch result {
                case .success(let auth):
                    switch auth.credential {
                    case let credential as ASAuthorizationAppleIDCredential:
                        // Obtain user ID
                        let userId = credential.user
                        
                        // Obtain user info
                        let email = credential.email
                        let firstName = credential.fullName?.givenName
                        
                        self.storedEmail = email ?? ""
                        self.userId = userId
                        self.firstName = firstName ?? email ?? "User"
                    default:
                        break
                    }
                case .failure(_):
                    break
                }
            }
            .signInWithAppleButtonStyle(colorScheme == .dark ? .white : .black)
            .frame(height: 50)
            .cornerRadius(50.0)
        }
        .padding(21.5)
    }
}

struct WelcomeView: View {
    var body: some View {
        VStack  {
            Text("Welcome to Digimark!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 20)
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
