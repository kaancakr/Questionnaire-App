//
//  CourseViewModel.swift
//  Onyx Code
//
//  Created by Kaan Çakır on 24.08.2024.
//

import SwiftUI

class CourseViewModel: ObservableObject {
    @Published var courses: [Course] = Course.courses
    
    // Function to add a new course
    func addCourse(courseDescription: String, courseRate: Double) {
        let newCourse = Course(courseDescription: courseDescription, courseRate: courseRate)
        courses.append(newCourse)
    }
    
    var mostRatedCourse: Course? {
        courses.max(by: { $0.courseRate < $1.courseRate })
    }
    
    // Function to remove a course by description
    func removeCourse(courseDescription: String) {
        courses.removeAll { $0.courseDescription == courseDescription }
    }
    
    // Function to update a course rate by description
    func updateCourseRate(courseDescription: String, newRate: Double) {
        if let index = courses.firstIndex(where: { $0.courseDescription == courseDescription }) {
            courses[index].courseRate = newRate
        }
    }
    
    func toggleCourseExpansion(of course: Course) {
        if let index = courses.firstIndex(where: {$0.id == course.id}) {
            courses[index].isExpanded.toggle()
        }
    }
}
