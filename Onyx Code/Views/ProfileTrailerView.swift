//
//  ProfileTrailerView.swift
//  Onyx Code
//
//  Created by Kaan Çakır on 24.08.2024.
//

import SwiftUI

struct ProfileTrailerView: View {
    var body: some View {
        HStack(alignment: .center) {
            Button(
                action: {
                    print("profile button tapped")
                },
                label: {
                    Image(systemName: "person")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.black)
                        .transition(.scale)
                        .zIndex(1)
                        .padding()
            })
            .buttonStyle(ProfileButtonView())
            .padding(.leading, 20)
            HStack(alignment: .center) {
                VStack(alignment: .leading) {
                    Text("Kaan")
                        .bold()
                        .font(.system(size: 26))
                        .fontDesign(.monospaced)
                        .foregroundColor(.white)
                    Text("Cakir")
                        .bold()
                        .font(.system(size: 28))
                        .fontDesign(.monospaced)
                        .foregroundColor(.white)
                }.padding(.bottom, 10)
                Spacer()
                Button (
                    action: {
                        print("settings button tapped")
                    },
                    label: {
                        Image(systemName: "gearshape.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(OnyxColor.secondaryColor)
                    }
                ).padding(.trailing, 10)
            }.padding(.top, 10)

            Spacer()
        }
        .padding(.top, 20)
    }
}

#Preview {
    ProfileTrailerView()
}
