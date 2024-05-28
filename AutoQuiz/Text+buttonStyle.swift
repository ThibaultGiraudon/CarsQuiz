//
//  Text+buttonStyle.swift
//  AutoQuiz
//
//  Created by Thibault Giraudon on 28/05/2024.
//

import Foundation
import SwiftUI

struct ButtonStyle: ViewModifier {
    var color: Color
    
    func body(content: Content) -> some View {
        content
            .font(.title)
            .bold()
            .foregroundStyle(color)
            .brightness(-0.2)
            .padding(.vertical)
            .frame(width: UIScreen.main.bounds.width - 20)
            .background(
                color
            )
            .clipShape(.capsule)
    }
}

extension Text {
    func buttonStyle(_ color: Color) -> some View {
        modifier(ButtonStyle(color: color))
    }
}
