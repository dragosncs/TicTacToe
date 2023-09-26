//
//  FirebaseService.swift
//  TicTacToe
//
//  Created by Dragos Neacsu on 26.09.2023.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift
import Combine

final class FirebaseService: ObservableObject {
    static let shared = FirebaseService()
    
    @Published var game: Game!
    
    
    init() { }
    
    
}
