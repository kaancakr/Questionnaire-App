//
//  ContentView.swift
//  Onyx Code
//
//  Created by Kaan Çakır on 1.08.2024.
//

import SwiftUI

struct GameView: View {
    @StateObject var viewModel = GameViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                OnyxColor.mainColor.ignoresSafeArea()
                VStack {
                    Text(viewModel.questionProgressText)
                        .font(.callout)
                        .multilineTextAlignment(.leading)
                        .padding()
                    QuestionView(question: viewModel.currentQuestion)
                }
                .foregroundColor(.white)
                .navigationBarHidden(true)
                .environmentObject(viewModel)
            }
            .background(
                NavigationLink(destination:
                                ScoreView(viewModel:
                                            ScoreViewModel(correctGuesses:
                                                            viewModel.correctGuesses,
                                                            incorrectGuesses:
                                                            viewModel.incorrectGuesses)),
                               isActive: .constant(viewModel.gameIsOver),
                               label: { EmptyView() })
            )
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
