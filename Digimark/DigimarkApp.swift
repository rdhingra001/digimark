//
//  DigimarkApp.swift
//  Digimark
//
//  Created by Ronit Dhingra on 6/23/22.
//

import SwiftUI
import FirebaseCore

@main
struct DigimarkApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
