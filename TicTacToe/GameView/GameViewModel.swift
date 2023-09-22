//
//  GameViewModel.swift
//  TicTacToe
//
//  Created by Dragos Neacsu on 19.09.2023.
//

import Foundation
import SwiftUI

final class GameViewModel: ObservableObject {
    let columns: [GridItem] = [GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible())]
    @Published var game = Game(id: UUID().uuidString, player1Id: "Player1", player2Id: "Player2",
                               blockMoveForPlayerId: "Player2", winningPlayerId: "", rematchPlayerId: [], moves: Array(repeating: nil, count: 9))
    
    private let winPatters: Set<Set<Int>> = [[0,1,2],[3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8],[0,4,8],[2,4,6]]
    
    func processPlayerMove(for position: Int) {
        if isSquareAvailable(in: game.moves, forIndex: position) {return}
        
        game.moves[position] = Move(isPlayer1: true, boardIndex: position)
        game.blockMoveForPlayerId = "player2"
        
        if checkIfWin(for: true, in: game.moves) {
            print("You have won")
            return
        }
        if checkForDraw(in: game.moves) {
            print ("Draw")
            return
        }
    }
    
    func isSquareAvailable(in moves: [Move?], forIndex index: Int) -> Bool {
        return moves.contains (where: { $0?.boardIndex == index  })
    }
    
    func checkIfWin(for player1: Bool, in moves:[Move?]) -> Bool {
        let playerMoves = moves.compactMap{ $0 }.filter{ $0.isPlayer1 == player1 }
        let playerPosition = Set(playerMoves.map {$0.boardIndex})
        for pattern in winPatters where pattern.isSubset(of: playerPosition) { return true}
        
        return false
        
    }
    
    func checkForDraw( in moves: [Move?]) -> Bool {
        return moves.compactMap { $0 }.count == 9
    }
}
