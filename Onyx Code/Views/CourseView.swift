//
//  CourseView.swift
//  Onyx Code
//
//  Created by Kaan Çakır on 24.08.2024.
//

import SwiftUI

struct CourseView: View {
    @StateObject private var courseViewModel = CourseViewModel()
    var body: some View {
        VStack(spacing: 20) {
            ZStack {
                Image("swiftpic")
                    .resizable()
                    .scaledToFit()
                    .blur(radius: 5)
                    .frame(height: 200)
                    .overlay(
                        VStack {
                            Text("Course Overview")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .padding()
                            Text("Explore our wide range of courses and enhance your skills.")
                                .font(.subheadline)
                                .foregroundColor(.black)
                                .padding([.leading, .trailing, .bottom])
                        }.background(
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
                    )
            }
            List(courseViewModel.courses) { course in
                CourseListView(viewModel: courseViewModel, course: course)
                    .listRowBackground(Color.clear)
                    .listRowSeparator(.hidden)
            }
            .listStyle(PlainListStyle())
            .background(Color.clear)
        }
        .background(OnyxColor.mainColor.ignoresSafeArea())
    }
}

#Preview {
    CourseView()
}
