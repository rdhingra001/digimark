//
//  AuthenticateView.swift
//  Digimark
//
//  Created by Ronit Dhingra on 6/24/22.
//

import SwiftUI

struct AuthenticateView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color("BackgroundColor").edgesIgnoringSafeArea(.all)
                VStack {
                    Spacer()
                    ZStack {
                        Image(uiImage: #imageLiteral(resourceName: "OpeningGraphic"))
                            .resizable()
                            .frame(width: getRect().width / 1.25, height: getRect().height / 3.5)
                    }
                    Spacer()
                    NavigationLink(destination: GuestSignUpView()) {
                        Text("Get Started")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color("PrimaryColor"))
                            .cornerRadius(50.0)
                            .shadow(color: Color.black.opacity(0.08), radius: 60, x: 0.0, y: 16)
                    }
                    NavigationLink(destination: GuestSignInView()) {
                        Text("Sign In")
                            .font(.title3)
                            .fontWeight(.bold)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color("SecondaryBackground"))
                            .border(Color("PrimaryColor"), width: 4, cornerRadius: 50.0)
                            .cornerRadius(50.0)
                            .shadow(color: Color.black.opacity(0.08), radius: 60, x: 0.0, y: 16)
                            .foregroundColor(Color("PrimaryColor"))
                            .padding(.vertical)
                    }
                    Spacer()
                }
                .padding()
            }
        }
        .navigationBarHidden(true)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AuthenticateView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticateView()
    }
}
