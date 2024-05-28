//
//  ContentView.swift
//  AutoQuiz
//
//  Created by Thibault Giraudon on 27/05/2024.
//

import SwiftUI

struct Car: Decodable, Hashable {
    var name: String
    var guessImage: String
}

struct ContentView: View {
    @StateObject var user = User()
    var body: some View {
        ZStack {
            if user.inGame {
                QuizLogoView(user: user)
            } else if user.gameOver {
                GameOverView(user: user)
            } else {
                MenuView(user: user)
            }
        }
    }
}


#Preview {
    ContentView()
}
