//
//  GameViewModel.swift
//  TicTacToe
//
//  Created by Dragos Neacsu on 19.09.2023.
//

import Foundation
import SwiftUI

final class GameViewModel: ObservableObject{
    let columns: [GridItem] = [GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible())]
    @Published var game = Game(id: UUID().uuidString, player1Id: "Player1", player2Id: "Player2",
                               blockMoveForPlayerId: "Player2", winningPlayerId: "", rematchPlayerId: [], moves: Array(repeating: nil, count: 9))
    
    func processPlayerMove(for position: Int) {
        if isSquareAvailable(in: game.moves, forIndex: position) {return}
        
        game.moves[position] = Move(isPlayer1: true, boardIndex: position)
    }
    
    func isSquareAvailable(in moves: [Move?], forIndex index: Int) -> Bool {
        return moves.contains (where: { $0?.boardIndex == index  })
    }
}
