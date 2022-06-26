//
//  AccountView.swift
//  Digimark
//
//  Created by Ronit Dhingra on 6/24/22.
//

import SwiftUI

struct AccountView: View {
    var body: some View {
        VStack(spacing: getRect().height/10) {
            VStack(spacing: getRect().height/50) {
                Image(uiImage: #imageLiteral(resourceName: "DefaultUserPFP"))
                VStack(spacing: getRect().height/100) {
                    Text("Your Name")
                        .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color("PrimaryColor"))
                    Text(verbatim: "example@gmail.com")
                        .foregroundColor(Color("PrimaryColor"))
                        .font(.caption)
                        .fontWeight(.semibold)
                }
            }
            Text("Change your icon by long-pressing on the current icon.")
                .font(.caption)
                .foregroundColor(.black.opacity(0.4))
                .fontWeight(.medium)
            VStack {
                HStack {
                    Image(systemName: "exclamationmark.triangle.fill")
                        .foregroundColor(.red)
                    Text("Danger Zone")
                        .foregroundColor(.red)
                        .font(.callout)
                        .fontWeight(.bold)
                }
                PrimaryButton(title: "Sign Out", action: {
                    print("logged out...or so you think")
                }, color: .red)
            }
        }
        .padding()
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
