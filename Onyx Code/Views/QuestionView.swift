//
//  QuestionView.swift
//  Onyx Code
//
//  Created by Kaan Çakır on 23.08.2024.
//

import SwiftUI

struct QuestionView: View {
    
    @EnvironmentObject var viewModel: GameViewModel
    let question: Question
    @State var showCheckImage = false
    @State var showWrongImage = false
  
    var body: some View {
        ZStack {
            VStack {
                Text(question.questionText)
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.leading)
                    .padding()
                Spacer()
                VStack {
                    ForEach(0..<question.possibleAnswers.count) { answerIndex in
                        Button(action: {
                            handleAnswer(at: answerIndex)
                        }) {
                            ChoiceTextView(choiceText: question.possibleAnswers[answerIndex])
                        }
                        .buttonStyle(QuestionButtonView())
                        .disabled(viewModel.guessWasMade)
                    }
                }
            }
            
            if showCheckImage {
                Image(systemName: "checkmark.circle")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.green)
                    .transition(.scale)
                    .zIndex(1) // Ensure the image is on top
            }
            
            if showWrongImage {
                Image(systemName: "xmark.circle")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.red)
                    .transition(.scale)
                    .zIndex(1) // Ensure the image is on top
            }
        }
        .background(OnyxColor.mainColor.ignoresSafeArea())
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func handleAnswer(at index: Int) {
        viewModel.makeGuess(atIndex: index)
        
        if viewModel.currentQuestion.correctAnswerIndex == index {
            showCheckImage = true
        } else {
            showWrongImage = true
        }
        
        // Move to the next question after a short delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            withAnimation {
                showCheckImage = false
                showWrongImage = false
            }
            viewModel.displayNextScreen()
        }
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(question: Game().currentQuestion).environmentObject(GameViewModel())
    }
}
