//
//  QuizLogoView.swift
//  AutoQuiz
//
//  Created by Thibault Giraudon on 28/05/2024.
//

import SwiftUI

struct QuizLogoView: View {
    @State private var cars = Bundle.main.decode("cars.json")
    @State private var correctAnswer = Car(name: "audi", guessImage: "audi")
    @State private var randomCars = [Car]()
    
    @ObservedObject var user: User
    
    var body: some View {
        VStack {
            Text("Score: \(user.score)")
                .bold()
                .font(.largeTitle)
                .foregroundStyle(.darkSlateDray)
                .padding()
            if (randomCars.isEmpty) {
                Text("Empty")
            } else {
                Image(correctAnswer.guessImage)
                    .resizable()
                    .scaledToFit()
            }
            Spacer()
            ForEach(0..<4) { index in
                Button {
                    submitAnswer(randomCars[index].name)
                } label: {
                    if !randomCars.isEmpty {
                        Text(randomCars[index].name)
                            .buttonStyle(.darkSlateDray)
                    }
                }
            }
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(.onyx)
        .onAppear(perform: {
            startGame()
        })
    }
    
    func submitAnswer(_ answer: String) {
        if correctAnswer.name == answer {
            user.score += 1
            if let index = cars.firstIndex(of: correctAnswer) {
                cars.remove(at: index)
                print(cars.count)
                print(cars)
            }
            if cars.isEmpty {
                user.inGame = false
                user.gameOver = true
                user.gameState = .win
            } else {
                startGame()
            }
        } else {
            user.inGame = false
            user.gameOver = true
            user.gameState = .loose
        }
    }
    
    func startGame() {
        var localCars = Bundle.main.decode("cars.json")
        randomCars.removeAll()
        randomCars.append(cars.randomElement()!)
        correctAnswer = randomCars[0]
        if let index = localCars.firstIndex(of: randomCars[0]) {
            localCars.remove(at: index)
        }
        localCars.shuffle()
        randomCars.append(contentsOf: [localCars[0], localCars[1], localCars[2]])
        randomCars.shuffle()
    }
    
}

#Preview {
    QuizLogoView(user: User())
}
