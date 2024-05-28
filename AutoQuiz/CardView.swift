//
//  CardView.swift
//  AutoQuiz
//
//  Created by Thibault Giraudon on 27/05/2024.
//

import SwiftUI

struct CardView: View {
    let car: Car
    @State private var rotate = false
    @State private var opacity = false
    
    var body: some View {
        ZStack {
            Image(car.guessImage)
                .resizable()
                .scaledToFit()
                .padding()
                .frame(height: 200)
                .opacity(opacity ? 0 : 1)
            Text(car.name)
                .font(.largeTitle)
                .bold()
                .rotation3DEffect(
                    .degrees(180),
                    axis: (x: 0.0, y: 1.0, z: 0.0)
                )
                .opacity(opacity ? 1 : 0)
        }
        .background(
            RoundedRectangle(cornerRadius: 25)
                .fill(.lightBlue)
                .shadow(radius: 10)
        )
        .onTapGesture {
            withAnimation {
                rotate.toggle()
                opacity.toggle()
            }
        }
        .rotation3DEffect(
            .degrees(rotate ? 180 : 0),
            axis: (x: 0.0, y: 1.0, z: 0.0)
        )
    }
}

#Preview {
    CardView(car: Car(name: "tesla", guessImage: "tesla"))
}
