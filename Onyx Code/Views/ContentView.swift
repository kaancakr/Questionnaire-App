//
//  ContentView.swift
//  Onyx Code
//
//  Created by Kaan Çakır on 1.08.2024.
//

import SwiftUI

struct ContentView: View {
    let mainColor = Color(red: 24/255, green: 54/255, blue: 97/255)
    let accentColor = Color(red: 28/255, green: 75/255, blue: 130/255)
    let secondaryColor = Color(red: 221/255, green: 107/255, blue: 77/255)
    let choosingColor = Color(red: 218/255, green: 225/255, blue: 231/255)
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
                        Spacer(minLength: 105)
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
                                .buttonStyle(QuestionButtonStyle())
                                .padding(.bottom, 10)
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
