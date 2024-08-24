//
//  WelcomeView.swift
//  Onyx Code
//
//  Created by Kaan Çakır on 23.08.2024.
//

import SwiftUI

struct WelcomeView: View {
    @State private var isActive = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                OnyxColor.mainColor.ignoresSafeArea()
                VStack {
                    Spacer()
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Welcome to Onyx Code ")
                            .font(.system(size: 46))
                            .multilineTextAlignment(.leading)
                            .bold()
                            .padding()
                            .fontDesign(.monospaced)
                        Text("Start learning with question-answer modal")
                            .font(.title2)
                            .multilineTextAlignment(.leading)
                            .bold()
                            .padding()
                            .fontDesign(.monospaced)
                    }
                    VStack {
                        Spacer()
                        Button {
                            isActive = true
                        } label: {
                            Text("Login")
                                .bold()
                                .font(.system(size: 20))
                                .fontDesign(.rounded)
                                .frame(width: 280)
                                .foregroundStyle(Color.black)
                        }
                        .buttonStyle(QuestionButtonView())
                        .padding(.bottom, 5)
                        Button {
                            isActive = true
                        } label: {
                            Text("Register")
                                .bold()
                                .font(.system(size: 20))
                                .fontDesign(.rounded)
                                .frame(width: 280)
                                .foregroundStyle(Color.black)
                        }
                        .buttonStyle(QuestionButtonView())
                        .padding(.bottom, 5)
                        Button {
                            isActive = true
                        } label: {
                            Text("Google")
                                .bold()
                                .font(.system(size: 20))
                                .fontDesign(.rounded)
                                .frame(width: 280)
                                .foregroundStyle(Color.black)
                        }
                        .buttonStyle(QuestionButtonView())
                        Spacer()
                    }
                }
                .foregroundColor(.white)
            }
            .navigationDestination(isPresented: $isActive) {
                HomeView()
            }
        }
    }
}

#Preview {
    WelcomeView()
}
