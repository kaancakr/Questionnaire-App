//
//  Course.swift
//  Onyx Code
//
//  Created by Kaan Çakır on 24.08.2024.
//

import Foundation

struct Course: Hashable, Identifiable {
    let id = UUID()
    let courseDescription: String
    var courseRate: Double
    var isExpanded: Bool = false
    
    static var courses = [
        Course(courseDescription: "Introduction to Swift", courseRate: 4.5),
        Course(courseDescription: "Advanced iOS Development", courseRate: 4.7),
        Course(courseDescription: "Data Structures and Algorithms in Swift", courseRate: 4.8),
        Course(courseDescription: "UI/UX Design Principles", courseRate: 4.6),
        Course(courseDescription: "Networking in Swift", courseRate: 4.4),
        Course(courseDescription: "Core Data Essentials", courseRate: 4.5),
        Course(courseDescription: "SwiftUI for Beginners", courseRate: 4.9),
        Course(courseDescription: "Concurrency in Swift", courseRate: 4.3),
        Course(courseDescription: "Testing and Debugging in iOS", courseRate: 4.6)
    ]
}
