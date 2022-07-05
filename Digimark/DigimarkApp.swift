//
//  DigimarkApp.swift
//  Digimark
//
//  Created by Ronit Dhingra on 6/23/22.
//

import SwiftUI
import FirebaseCore

// Define observable
class AppState: ObservableObject {
    @Published var isAuthenticated: Bool
    @Published var isGuest: Bool
    @Published var isCreatingNote: Bool
    @Published var isFinalizingNote: Bool
    @Published var tempNote: ScanData?
    
    init(isAuthenticated: Bool, isGuest: Bool, isCreatingNote: Bool, isFinalizingNote: Bool, tempNote: ScanData?) {
        self.isAuthenticated = isAuthenticated
        self.isGuest = isGuest
        self.isCreatingNote = isCreatingNote
        self.isFinalizingNote = isFinalizingNote
        self.tempNote = tempNote
    }
}

@main
struct DigimarkApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    @ObservedObject var appState = AppState(isAuthenticated: false, isGuest: false, isCreatingNote: false, isFinalizingNote: false, tempNote: nil)
    
    var body: some Scene {
        WindowGroup {
            WelcomeView()
                .environmentObject(appState)
        }
    }
}
