//
//  CreateNoteView.swift
//  Digimark
//
//  Created by Ronit Dhingra on 6/25/22.
//

import SwiftUI

struct CreateNoteView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            Color("BackgroundColor").ignoresSafeArea()
            VStack {
                Spacer()
                PrimaryButton(title: "Scan Note") {
                    CaptureView().edgesIgnoringSafeArea(.all)
                }
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
            }
            .padding()
        }
        .navigationTitle("New Note")
    }
}

struct CreateNoteView_Previews: PreviewProvider {
    static var previews: some View {
        CreateNoteView()
    }
}
