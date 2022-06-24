//
//  WelcomeView.swift
//  Digimark
//
//  Created by Ronit Dhingra on 6/24/22.
//

import SwiftUI


struct WelcomeView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color("BackgroundColor").edgesIgnoringSafeArea(.all)
                VStack {
                    Spacer()
                    ZStack {
                        Image(uiImage: #imageLiteral(resourceName: "OpeningGraphic"))
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width / 1.25, height: UIScreen.main.bounds.height / 3.5)
                    }
                    Spacer()
                    NavigationLink(destination: SignUpView()) {
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
                    NavigationLink(destination: SignInView()) {
                        Text("Sign In")
                            .font(.title3)
                            .fontWeight(.bold)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(.white)
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

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
