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
    
    @State private var guestAttemptNote: Bool = false
    
    @State private var notes: [ScanData] = []
    
    init() {
        UITableView.appearance().backgroundColor = Color("BackgroundColor").ignoresSafeArea() as? UIColor
    }
    
    var body: some View {
        TabView {
            NavigationView {
                ZStack {
                    Color("BackgroundColor").ignoresSafeArea()
                    VStack {
                        if notes.count > 0 {
                            ZStack {
                                List {
                                    if colorScheme == .dark {
                                        ForEach(notes) { note in
                                            NavigationLink(
                                                destination: ScrollView { Text(note.content) },
                                                label: {
                                                    Text(note.content).lineLimit(1)
                                                }
                                            )
                                        }
                                        .listRowBackground(Color("SecondaryBackground").ignoresSafeArea())
                                    }
                                    else {
                                        ForEach(notes) { note in
                                            NavigationLink(
                                                destination: ScrollView { Text(note.content) },
                                                label: {
                                                    Text(note.content).lineLimit(1)
                                                }
                                            )
                                        }
                                    }
                                }
                                .shadow(color: Color.black.opacity(0.1), radius: 60, x: 0.0, y: 16)
                                
                            }
                            .padding(.top, 5)
                        }
                        else {
                            Spacer()
                            Text("Oh no! You should get your notes in!\nCreate your first note by pressing the + icon")
                                .foregroundColor(colorScheme == .light ? .black.opacity(0.4) : .white.opacity(0.5))
                                .multilineTextAlignment(.center)
                            
                            Spacer()
                            if appState.isGuest {
                                GuestWarningView()
                                Spacer()
                            }
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
                            makeCaptureView()
                        })
                    }
                    .navigationTitle("Notes")
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
    
    private func makeCaptureView() -> CaptureView {
        CaptureView { textPerPage in
            if let output = textPerPage?.joined(separator: "\n").trimmingCharacters(in: .whitespacesAndNewlines) {
                let newScanData = ScanData(content: output)
                self.appState.tempNote = newScanData
                self.appState.isCreatingNote = false
                self.appState.isFinalizingNote = true
//                self.notes.append(newScanData)
            }
        }
    }
}

struct NotesMenuView_Previews: PreviewProvider {
    static var previews: some View {
        NotesMenuView()
            .preferredColorScheme(.dark)
            .environmentObject(AppState(isAuthenticated: false, isGuest: true, isCreatingNote: false, isFinalizingNote: false, tempNote: nil))
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
