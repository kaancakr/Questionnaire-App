//
//  ChoiceTextView.swift
//  Onyx Code
//
//  Created by Kaan Çakır on 14.08.2024.
//

import SwiftUI

struct ChoiceTextView: View {
    
    let choiceText: String
    
    var body: some View {
        Text(choiceText)
            .bold()
            .font(.body)
            .multilineTextAlignment(.leading)
            .padding(.leading, 10)
            .frame(maxWidth: 315, minHeight: 40, alignment: .leading)
            .foregroundColor(Color.black)
    }
}
