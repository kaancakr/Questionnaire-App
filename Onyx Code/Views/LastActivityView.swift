//
//  LastActivityView.swift
//  Onyx Code
//
//  Created by Kaan Çakır on 24.08.2024.
//

import SwiftUI

struct LastActivityView: View {
    @ObservedObject var courseViewModel: CourseViewModel
    @Binding var isCourseActive: Bool
    
    var body: some View {
        VStack {
            HStack {
                Text("Last Activity")
                    .bold()
                    .font(.system(size: 22))
                    .fontDesign(.monospaced)
                    .padding(.leading, 20)
                    .foregroundColor(.white)
                Spacer()
                Button (
                    action: {
                        print("show more tapped")
                    }, label: {
                        Text("Show more")
                            .bold()
                            .font(.system(size: 16))
                            .fontDesign(.monospaced)
                    }
                ).padding(.trailing, 20)
            }
            .padding(.top, 30)

            Button (
                action: {
                    isCourseActive = true
                }, label: {
                    VStack(alignment: .leading) {
                        Text(courseViewModel.mostRatedCourse?.courseDescription ?? "SwiftUI")
                            .bold()
                            .font(.system(size: 20))
                            .fontDesign(.monospaced)
                            .foregroundStyle(Color.black)
                            .multilineTextAlignment(.leading)
                        HStack {
                            Text("Go to course")
                                .bold()
                                .font(.system(size: 18))
                                .fontDesign(.monospaced)
                                .foregroundStyle(OnyxColor.mainColor)
                                .multilineTextAlignment(.leading)
                            Image(systemName: "arrowshape.turn.up.forward")
                                .foregroundColor(OnyxColor.mainColor)
                                .scaledToFit()
                                .padding(.bottom, 5)
                        }.padding(.top, 2)
                        
                    }.frame(width: 310, height: 60, alignment: .leading)
                        .padding()
                }
            ).buttonStyle(LastActivityButtonView())
            Spacer()
        }
    }
}

#Preview {
    LastActivityView(courseViewModel: CourseViewModel(), isCourseActive: .constant(false))
}
