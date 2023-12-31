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
    
    func createOnlineGame() {
        do {
            try  FirebaseReference(.Game).document(self.game.id).setData(from: self.game)
        }catch {
            print("Error creating online game", error.localizedDescription)
        }
    }
    
    func startGame(with userId: String) {
        //Check if there's a game to join
        FirebaseReference(.Game).whereField("player2Id", isEqualTo: "").whereField("player1Id", isNotEqualTo: userId).getDocuments { querySnapshot, error in
            if error != nil {
                print("Error starting game", error!.localizedDescription)
                //Create new game
                self.createNewGame(with: userId)
                return
            }
            
            if let gameData = querySnapshot?.documents.first {
                self.game = try? gameData.data(as: Game.self)
                self.game.player2Id = userId
                self.game.blockMoveForPlayerId = userId
                
                self.updateGame(self.game)
                self.listenForGame()
            } else {
                self.createNewGame(with: userId)
            }
        }
    }
    
    func listenForGame(){
        FirebaseReference(.Game).document(self.game.id).addSnapshotListener{ documentSnapshot, error in
            print("changes received from firebase")
            
            if error != nil {
                print("Error listening to changes", error?.localizedDescription as Any)
                return
            }
            if let snapshot = documentSnapshot {
                self.game = try? snapshot.data(as: Game.self)
            }
        }
    }
    
    func createNewGame(with userId: String) {
        self.game = Game(id: UUID().uuidString, player1Id: userId, player2Id: "", blockMoveForPlayerId: userId, winningPlayerId: "", rematchPlayerId: [], moves: Array(repeating: nil, count: 9))
        self.createOnlineGame()
        self.listenForGame()
        
    }
    
    func updateGame(_ game: Game){
        do {
            try FirebaseReference(.Game).document(game.id).setData(from: game)
        } catch {
            print("Error updating online game", error.localizedDescription)
        }
    }
    
    func quitGame(){
        guard game != nil else {return}
        FirebaseReference(.Game).document(self.game.id).delete()
    }
}
