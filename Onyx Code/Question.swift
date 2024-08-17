//
//  Question.swift
//  Onyx Code
//
//  Created by Kaan Çakır on 14.08.2024.
//

import Foundation

struct Question: Hashable {
    let questionText: String
    let possibleAnswers: [String]
    let correctAnswerIndex: Int
    
    static var allQuestions = [
        Question(questionText: "Who invented the World Wide Web?",
                 possibleAnswers: [
                    "Steve Jobs",
                    "Linus Torvalds",
                    "Bill Gates",
                    "Tim Berners-Lee"
                 ],
                 correctAnswerIndex: 3),
        Question(questionText: "What was the first object oriented programming language?",
                 possibleAnswers: [
                    "Simula",
                    "Python",
                    "Swift",
                    "C"
                 ],
                 correctAnswerIndex: 0),
        Question(questionText: "Which programming language is known as the 'mother of all languages'?",
                 possibleAnswers: [
                    "C",
                    "FORTRAN",
                    "Assembly",
                    "Lisp"
                 ],
                 correctAnswerIndex: 1),
        Question(questionText: "Which of the following is not a high-level programming language?",
                 possibleAnswers: [
                    "C++",
                    "Python",
                    "JavaScript",
                    "Assembly"
                 ],
                 correctAnswerIndex: 3),
        Question(questionText: "Who is the creator of the Linux operating system?",
                 possibleAnswers: [
                    "Bill Gates",
                    "Mark Zuckerberg",
                    "Linus Torvalds",
                    "Steve Jobs"
                 ],
                 correctAnswerIndex: 2),
        Question(questionText: "What year was the Python programming language first released?",
                 possibleAnswers: [
                    "1989",
                    "1991",
                    "1995",
                    "2000"
                 ],
                 correctAnswerIndex: 1),
        Question(questionText: "What does 'HTML' stand for?",
                 possibleAnswers: [
                    "HyperText Markup Language",
                    "Hyperlink and Text Markup Language",
                    "Home Tool Markup Language",
                    "Hyperlink Text Management Language"
                 ],
                 correctAnswerIndex: 0),
        Question(questionText: "Which of the following is a front-end web development framework?",
                 possibleAnswers: [
                    "Django",
                    "Laravel",
                    "React",
                    "Flask"
                 ],
                 correctAnswerIndex: 2),
        Question(questionText: "Which company developed the Java programming language?",
                 possibleAnswers: [
                    "Microsoft",
                    "Apple",
                    "Sun Microsystems",
                    "Google"
                 ],
                 correctAnswerIndex: 2),
        Question(questionText: "Which version control system is widely used for managing source code?",
                 possibleAnswers: [
                    "SVN",
                    "Git",
                    "Mercurial",
                    "CVS"
                 ],
                 correctAnswerIndex: 1)
    ]
}
