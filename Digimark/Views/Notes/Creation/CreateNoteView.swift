//
//  CreateNoteView.swift
//  Digimark
//
//  Created by Ronit Dhingra on 6/25/22.
//

// FIX THE EXIT MENU (EXPERIMENT WITH ADDING CREATENOTEVIEW AS ENVIRONMENT OBJECT TO CARRY OVER STATE)

import SwiftUI

struct CreateNoteView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var appState: AppState

    @State var title: String = ""
    @State var finalNote: String = ""
    
    @State private var showingOptions = false
    
    var body: some View {
        ZStack {
            Color("BackgroundColor").ignoresSafeArea()
            VStack {
                Text(appState.tempNote!.content)
            }
            .padding()
        }
        .navigationTitle("New Note")
        .navigationBarBackButtonHidden(true)
        .toolbar {
            Button {
                showingOptions = true
            } label: {
                Image(systemName: "xmark.circle.fill")
            }
            .confirmationDialog("Are you sure you want to abandon your note?", isPresented: $showingOptions) {
                Button("Abandon", role: .destructive) {
                    appState.isFinalizingNote.toggle()
                    appState.tempNote = nil
                    showingOptions = false
                }
            }
        }
    }
}

struct CreateNoteView_Previews: PreviewProvider {
    static var previews: some View {
        CreateNoteView()
    }
}
