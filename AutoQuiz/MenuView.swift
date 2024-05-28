//
//  MenuView.swift
//  AutoQuiz
//
//  Created by Thibault Giraudon on 28/05/2024.
//

import SwiftUI

struct MenuView: View {
    @ObservedObject var user: User
    var body: some View {
        NavigationStack {
            VStack {
                Image(.logo)
                    .resizable()
                    .scaledToFit()
                    .padding()
                Spacer()
                Button {
                    user.inGame = true
                } label: {
                    Text("Play")
                        .buttonStyle(.darkSlateDray)
                }
                NavigationLink {
                    FlashcardLogoView()
                } label: {
                    Text("Flashcard")
                        .buttonStyle(.darkSlateDray)
                }
                .padding()
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .background(.onyx)
        }
    }
}

#Preview {
    MenuView(user: User())
}
