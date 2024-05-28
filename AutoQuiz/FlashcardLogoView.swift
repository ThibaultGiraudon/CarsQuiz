//
//  FlashCardLogoView.swift
//  AutoQuiz
//
//  Created by Thibault Giraudon on 28/05/2024.
//

import SwiftUI

struct FlashcardLogoView: View {
    @Environment(\.dismiss) var dismiss
    let cars = Bundle.main.decode("cars.json")
    @State private var rotate = false
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: [.init(), .init()]) {
                    ForEach(cars, id: \.self) { car in
                        CardView(car: car)
                    }
                }
            }
            .padding(.top)
            .background(.onyx)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: backButton)
        }
    }
        
    var backButton: some View {
        Button {
            dismiss()
        } label: {
            ZStack {
                Circle()
                    .frame(width: 40, height: 40)
                    .foregroundStyle(.lightBlue)
                Image(systemName: "arrow.backward")
                    .foregroundStyle(.black)
            }
        }
    }
}

#Preview {
    FlashcardLogoView()
}
