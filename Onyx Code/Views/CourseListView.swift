//
//  CourseListStyle.swift
//  Onyx Code
//
//  Created by Kaan Çakır on 24.08.2024.
//

import SwiftUI

struct CourseListView: View {
    @ObservedObject var viewModel: CourseViewModel
    let course: Course
    
    var body: some View {
        VStack {
            Button(action: {
                viewModel.toggleCourseExpansion(of: course)
            }) {
                HStack {
                    Text(course.courseDescription)
                        .font(.system(size: 22, weight: .bold, design: .rounded))
                        .foregroundColor(.black)
                    Spacer()
                    Image(systemName: course.isExpanded ? "chevron.up" : "chevron.down")
                        .foregroundColor(.black)
                }
                .padding()
                .background(
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.blue)
                            .stroke(Color.black, lineWidth: 3)
                            .offset(y: 10)
                        RoundedRectangle(cornerRadius: 20)
                            .fill(OnyxColor.secondaryColor)
                            .stroke(Color.black, lineWidth: 3)
                    }
                )
                .padding(.bottom, 10)
            }
            if course.isExpanded {
                Text("Course Rating: \(course.courseRate, specifier: "%.1f")")
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .transition(.move(edge: .top))
                    .animation(.easeInOut, value: course.isExpanded)
            }
        }
    }
}
