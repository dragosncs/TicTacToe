//
//  TicTacToeApp.swift
//  TicTacToe
//
//  Created by Dragos Neacsu on 18.09.2023.
//

import SwiftUI
import Firebase

@main
struct TicTacToeApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}
