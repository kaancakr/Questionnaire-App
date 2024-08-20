//
//  SummaryView.swift
//  Onyx Code
//
//  Created by Kaan Çakır on 17.08.2024.
//

import SwiftUI

struct SummaryView: View {
    let mainColor = Color(red: 22/255, green: 48/255, blue: 32/255)
    let accentColor = Color(red: 48/255, green: 77/255, blue: 48/255)
    let secondaryColor = Color(red: 182/255, green: 196/255, blue: 182/255)
    let choosingColor = Color(red: 238/255, green: 240/255, blue: 229/255)
    let correctGuesses: Int
    let incorrectGuesses: Int
    let onPlayAgain: () -> Void
    
    var body: some View {
        VStack {
            Text("Game Over")
                .font(.largeTitle)
                .bold()
                .padding()
                .foregroundColor(accentColor)
            
            Text("Correct Answers: \(correctGuesses)")
                .font(.title)
                .foregroundColor(.green)
                .padding(.top)
                .bold()
            
            Text("Incorrect Answers: \(incorrectGuesses)")
                .font(.title)
                .foregroundColor(.red)
                .padding(.top)
                .bold()
            
            Button(action: {
                onPlayAgain()
            }) {
                Text("Play Again")
                    .padding()
                    .background(accentColor)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .fontWeight(.heavy)
            }
            .padding(.top)
        }
        .padding()
    }
}

#Preview {
    SummaryView(correctGuesses: 3, incorrectGuesses: 2, onPlayAgain: {})
}
