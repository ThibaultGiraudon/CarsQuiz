//
//  User.swift
//  AutoQuiz
//
//  Created by Thibault Giraudon on 28/05/2024.
//

import Foundation

class User: ObservableObject {
    @Published var inGame = false
    @Published var gameOver = false
    @Published var score = 0
    @Published var gameState = GameState.loose
}

enum GameState {
    case win, loose
}
