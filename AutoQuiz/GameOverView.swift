//
//  GameOverView.swift
//  AutoQuiz
//
//  Created by Thibault Giraudon on 28/05/2024.
//

import SwiftUI

struct GameOverView: View {
    @ObservedObject var user: User
    var body: some View {
        VStack {
            Image(.gameOver)
                .resizable()
                .scaledToFit()
                .padding(.horizontal)
            Text(user.gameState == .loose ? "Score: \(user.score)" : "You mastered this quiz!")
                .font(.largeTitle)
                .bold()
                .foregroundStyle(.darkSlateDray)
                .padding(.top)
            Spacer()
            Button {
                user.score = 0
                user.inGame = true
            } label: {
                Text("Try again")
                    .buttonStyle(.lightBlue)
            }
            Button {
                user.gameOver = false
            } label: {
                Text("Menu")
                    .buttonStyle(.darkSlateDray)
            }
            .padding()
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(.onyx)
    }
}

#Preview {
    GameOverView(user: User())
}
