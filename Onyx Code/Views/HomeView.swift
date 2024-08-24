//
//  HomeView.swift
//  Onyx Code
//
//  Created by Kaan Çakır on 24.08.2024.
//

import SwiftUI

struct HomeView: View {
    @State private var isCourseActive = false
    
    var body: some View {
        ZStack {
            OnyxColor.mainColor.ignoresSafeArea()

            VStack {
                ProfileTrailerView()
                Spacer()
                LastActivityView(courseViewModel: CourseViewModel(), isCourseActive: $isCourseActive)
            }
            .navigationDestination(isPresented: $isCourseActive) {
                CourseView()
            }
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    HomeView()
}
