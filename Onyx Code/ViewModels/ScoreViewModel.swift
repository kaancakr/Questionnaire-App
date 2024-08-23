//
//  ScoreViewModel.swift
//  Onyx Code
//
//  Created by Kaan Çakır on 23.08.2024.
//

import Foundation

struct ScoreViewModel {
    let correctGuesses: Int
    let incorrectGuesses: Int
    
    var percentage: Int {
        (correctGuesses * 100 / (correctGuesses + incorrectGuesses))
    }
}
