//
//  ContentView.swift
//  Onyx Code
//
//  Created by Kaan Çakır on 1.08.2024.
//

import SwiftUI

struct ContentView: View {
    let mainColor = Color(red: 20/255, green: 28/255, blue: 58/255)
    @State var showCheckImage = false
    @State var showWrongImage = false
    @State var currentQuestionIndex = 0
    let accentColor = Color(red: 48/255, green: 105/255, blue: 240/255)
    
    // Array of questions
    let questions: [Question] = [
        Question(questionText: "What was the first computer bug?", possibleAnswers: ["Ant", "Beetle", "Moth", "Fly"], correctAnswerIndex: 2, questionIndex: 0),
        Question(questionText: "Which programming language is used for iOS development?", possibleAnswers: ["Python", "Swift", "JavaScript", "Kotlin"], correctAnswerIndex: 1, questionIndex: 1),
        Question(questionText: "What is the capital of France?", possibleAnswers: ["Berlin", "London", "Paris", "Madrid"], correctAnswerIndex: 2, questionIndex: 2)
    ]
    
    var body: some View {
        ZStack {
            mainColor.ignoresSafeArea()
            VStack {
                HStack {
                    Spacer(minLength: 150)
                    Text("\(currentQuestionIndex + 1)/\(questions.count)")
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
                
                Text(questions[currentQuestionIndex].questionText)
                    .font(.largeTitle)
                    .multilineTextAlignment(.leading)
                    .bold()
                
                Spacer()
                
                VStack(spacing: 10) {
                    ForEach(0..<questions[currentQuestionIndex].possibleAnswers.count, id: \.self) { answerIndex in
                        Button(action: {
                            print("Tapped on option with the text: \(questions[currentQuestionIndex].possibleAnswers[answerIndex])")
                            if answerIndex == questions[currentQuestionIndex].correctAnswerIndex {
                                showCheckImage = true
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                    showCheckImage = false
                                    if currentQuestionIndex < questions.count - 1 {
                                        currentQuestionIndex += 1
                                    } else {
                                        currentQuestionIndex = 0
                                    }
                                }
                            } else if answerIndex != questions[currentQuestionIndex].correctAnswerIndex {
                                showWrongImage = true
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                    showWrongImage = false
                                    if currentQuestionIndex < questions.count - 1 {
                                        currentQuestionIndex += 1
                                    } else {
                                        currentQuestionIndex = 0
                                    }
                                }
                            }
                        }, label: {
                            ChoiceTextView(choiceText: questions[currentQuestionIndex].possibleAnswers[answerIndex])
                        })
                        .padding(.bottom, 5)
                    }
                }
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
            }
            
            if showWrongImage {
                Image(systemName: "xmark.circle")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.red)
                    .transition(.scale)
                    .background(mainColor)
                    .cornerRadius(50)
            }
        }
    }
}

#Preview {
    ContentView()
}
