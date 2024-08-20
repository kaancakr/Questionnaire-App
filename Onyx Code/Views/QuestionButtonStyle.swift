//
//  QuestionButtonStyle.swift
//  Onyx Code
//
//  Created by Kaan Çakır on 20.08.2024.
//

import SwiftUI

struct QuestionButtonStyle: ButtonStyle {
    let mainColor = Color(red: 24/255, green: 54/255, blue: 97/255)
    let accentColor = Color(red: 28/255, green: 75/255, blue: 130/255)
    let secondaryColor = Color(red: 221/255, green: 107/255, blue: 77/255)
    let choosingColor = Color(red: 218/255, green: 225/255, blue: 231/255)
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 24, weight: .bold, design: .rounded))
            .padding()
            .background(
                ZStack {
                    Capsule()
                        .fill(.blue)
                        .stroke(.black, lineWidth: 3)
                        .offset(y:configuration.isPressed ? 0 : 10)
                    Capsule()
                        .fill(secondaryColor)
                        .stroke(.black, lineWidth: 3)
                }
            )
            .offset(y: configuration.isPressed ? 10 : 0)
    }
}
