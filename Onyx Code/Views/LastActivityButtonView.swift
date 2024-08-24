//
//  LastActivityButtonView.swift
//  Onyx Code
//
//  Created by Kaan Çakır on 24.08.2024.
//

import SwiftUI

struct LastActivityButtonView: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 24, weight: .bold, design: .rounded))
            .padding()
            .background(
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.blue)
                        .stroke(.black, lineWidth: 3)
                        .offset(y:configuration.isPressed ? 0 : 10)
                    RoundedRectangle(cornerRadius: 20)
                        .fill(OnyxColor.secondaryColor)
                        .stroke(.black, lineWidth: 3)
                }
            )
            .offset(y: configuration.isPressed ? 10 : 0)
            .padding(.bottom, 20)
    }
}
