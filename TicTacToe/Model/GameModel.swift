//
//  GameModel.swift
//  TicTacToe
//
//  Created by Dragos Neacsu on 19.09.2023.
//

import Foundation

struct Move: Codable {
    
    let isPlayer1: Bool
    let boardIndex: Int
    
    var indicator: String {
        return isPlayer1 ? "xmark" : "circle"
    }
}

struct Game: Codable {
    let id: String
    var player1Id: String
    var player2Id: String
    
    var blockMoveForPlayerId: String
    var winningPlayerId: String
    var rematchPlayerId: [String]
    var moves: [Move?]
}
