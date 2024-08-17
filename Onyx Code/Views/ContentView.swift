//
//  ContentView.swift
//  Onyx Code
//
//  Created by Kaan Çakır on 1.08.2024.
//

import SwiftUI

struct ContentView: View {
    let mainColor = Color(red: 20/255, green: 28/255, blue: 58/255)
    let accentColor = Color(red: 48/255, green: 105/255, blue: 240/255)
    @State var showCheckImage = false
    @State var showWrongImage = false
    @State var game = Game(currentQuestionIndex: 0)
    @State private var selectedAnswerIndex: Int? = nil
    
    var body: some View {
        ZStack {
            mainColor.ignoresSafeArea()
            
            if game.isOver {
                SummaryView(correctGuesses: game.quessesCount.correct, incorrectGuesses: game.quessesCount.incorrect, onPlayAgain: {
                    game.resetGame()
                })
            } else {
                VStack {
                    HStack {
                        Spacer(minLength: 110)
                        Text("Question \(game.currentQuestionIndex + 1) of \(game.numberOfQuestions)")
                            .font(.callout)
                            .multilineTextAlignment(.center)
                            .padding()
                        
                        Spacer()
                        
                        Button(action: {
                            print("Close button tapped")
                        }) {
                            Image(systemName: "xmark.circle")
                                .resizable()
                                .frame(width: 32, height: 32)
                                .foregroundColor(.white)
                                .padding()
                        }
                    }
                    
                    Text(game.currentQuestion.questionText)
                        .font(.largeTitle)
                        .multilineTextAlignment(.leading)
                        .bold()
                    
                    Spacer()
                    
                    VStack(spacing: 10) {
                        if !game.currentQuestion.possibleAnswers.isEmpty {
                            ForEach(0..<game.currentQuestion.possibleAnswers.count, id: \.self) { index in
                                Button(action: {
                                    selectedAnswerIndex = index
                                    
                                    if index == game.currentQuestion.correctAnswerIndex {
                                        showCheckImage = true
                                        showWrongImage = false
                                    } else {
                                        showWrongImage = true
                                        showCheckImage = false
                                    }
                                    
                                    game.makeGuessesForCurrentQuestion(atIndex: index)
                                    
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                        showCheckImage = false
                                        showWrongImage = false
                                        
                                        game.advanceToNextQuestion()
                                    }
                                }, label: {
                                    ChoiceTextView(choiceText: game.currentQuestion.possibleAnswers[index])
                                })
                                .padding(.bottom, 5)
                            }
                        }
                    }
                    
                    Spacer()
                }
                .foregroundColor(.white)
                .padding()
                
                if showCheckImage {
                    Image(systemName: "checkmark.circle")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.green)
                        .transition(.scale)
                        .background(mainColor)
                        .cornerRadius(50)
                        .zIndex(1)
                }
                
                if showWrongImage {
                    Image(systemName: "xmark.circle")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.red)
                        .transition(.scale)
                        .background(mainColor)
                        .cornerRadius(50)
                        .zIndex(1)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
