//
//  NotesMenuView.swift
//  Digimark
//
//  Created by Ronit Dhingra on 6/24/22.
//

import SwiftUI

struct NotesMenuView: View {
    @EnvironmentObject var appState: AppState
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        TabView {
            NavigationView {
                ZStack {
                    Color("BackgroundColor").ignoresSafeArea()
                    VStack {
                        Spacer()
                        Text("Oh no! You should get your notes in!\nCreate your first note by pressing the + icon")
                            .navigationTitle("Notes")
                            .foregroundColor(colorScheme == .light ? .black.opacity(0.4) : .white.opacity(0.5))
                            .multilineTextAlignment(.center)
                        
                        Spacer()
                        if appState.isGuest {
                            GuestWarningView()
                            Spacer()
                        }
                    }
                    .toolbar {
                        // pressing + will show camera, then will show New Note afterward
                        Button {
                            appState.isCreatingNote = true
                            print("Something should have happened")
                        } label: {
                            Label("Create", systemImage: "plus.circle.fill")
                        }
                        .fullScreenCover(isPresented: $appState.isCreatingNote, content: {
                            CaptureView()
                        })
                    }
                }
            }
            .tabItem {
                Image(systemName: "note.text")
                Text("Notes")
            }
            NavigationView {
                if appState.isGuest || !appState.isAuthenticated {
                    AuthenticateView()
                }
                else {
                    AccountView()
                }
            }
            .tabItem {
                Image(systemName: "person.circle.fill")
                Text("Account")
            }
        }
    }
}

struct NotesMenuView_Previews: PreviewProvider {
    static var previews: some View {
        NotesMenuView()
            .preferredColorScheme(.dark)
            .environmentObject(AppState(isAuthenticated: false, isGuest: true, isCreatingNote: false))
    }
}

struct GuestWarningView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack(spacing: 2.5) {
            HStack(spacing:0) {
                Text("Keep in mind that your notes will ")
                    .font(.caption)
                Text("not ")
                    .font(.caption)
                    .fontWeight(.bold)
                Text("save as a guest user.")
                    .font(.caption)
            }
            HStack(spacing: 0) {
                Text("Please go to the ")
                    .font(.caption)
                Text("Account ")
                    .font(.caption)
                    .fontWeight(.bold)
                Text("panel to sign in or create an account.")
                    .font(.caption)
            }
        }
        .foregroundColor(colorScheme == .light ? .black.opacity(0.6) : .white.opacity(0.7))
    }
}
