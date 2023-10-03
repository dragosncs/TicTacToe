//
//  GameNotification.swift
//  TicTacToe
//
//  Created by Dragos Neacsu on 26.09.2023.
//

import SwiftUI

enum GameState {
    case started
    case waitingForPlayer
    case finished
}


struct GameNotification {
    static let waitingForPlayer = "Waiting for player"
    static let gameHasStarted = "Game has started"
    static let gameFinished = "Player left the game"
}
