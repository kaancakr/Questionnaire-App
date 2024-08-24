//
//  ProfileButtonView.swift
//  Onyx Code
//
//  Created by Kaan Çakır on 24.08.2024.
//

import SwiftUI

struct ProfileButtonView: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 32, weight: .bold, design: .rounded))
            .padding()
            .background(
                Circle()
                    .fill(OnyxColor.secondaryColor)
                    .stroke(.black, lineWidth: 3)
            )
    }
}
