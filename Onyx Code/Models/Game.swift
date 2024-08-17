//
//  Game.swift
//  Onyx Code
//
//  Created by Kaan Çakır on 17.08.2024.
//

import Foundation

struct Game {
    private(set) var guesses = [Question: Int]()
    private(set) var isOver = false
    private(set) var currentQuestionIndex = 0
    private let questions = Question.allQuestions.shuffled()
    
    init(currentQuestionIndex: Int) {
        self.currentQuestionIndex = currentQuestionIndex
    }
    
    var quessesCount: (correct: Int, incorrect: Int) {
        var count: (correct: Int, incorrect: Int) = (0, 0)
        for (question, guessedIndex) in guesses {
            if question.correctAnswerIndex == guessedIndex {
                count.correct += 1
            } else {
                count.incorrect += 1
            }
        }
        return count
    }
    
    var numberOfQuestions: Int {
        questions.count
    }
    
    var currentQuestion: Question {
        questions[currentQuestionIndex]
    }
    
    mutating func makeGuessesForCurrentQuestion(atIndex index: Int) {
        guesses[currentQuestion] = index
    }
    
    mutating func updateGameStatus() {
        if currentQuestionIndex < questions.count - 1 {
            currentQuestionIndex += 1
        } else {
            isOver = true
        }
    }
    
    mutating func advanceToNextQuestion() {
        if currentQuestionIndex < numberOfQuestions - 1 {
            currentQuestionIndex += 1
        } else {
            isOver = true
        }
    }
    
    mutating func resetGame() {
        guesses = [:]
        currentQuestionIndex = 0
        isOver = false
    }
}
