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
    
    init(isAuthenticated: Bool, isGuest: Bool, isCreatingNote: Bool) {
        self.isAuthenticated = isAuthenticated
        self.isGuest = isGuest
        self.isCreatingNote = isCreatingNote
    }
}


@main
struct DigimarkApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    @ObservedObject var appState = AppState(isAuthenticated: false, isGuest: false, isCreatingNote: false)
    
    var body: some Scene {
        WindowGroup {
            WelcomeView()
                .environmentObject(appState)
        }
    }
}
