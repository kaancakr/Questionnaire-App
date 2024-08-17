//
//  ChoiceTextView.swift
//  Onyx Code
//
//  Created by Kaan Çakır on 14.08.2024.
//

import SwiftUI

struct ChoiceTextView: View {
    let mainColor = Color(red: 20/255, green: 28/255, blue: 58/255)
    let accentColor = Color(red: 48/255, green: 105/255, blue: 240/255)
    
    let choiceText: String
    
    var body: some View {
        Text(choiceText)
            .bold()
            .font(.body)
            .multilineTextAlignment(.leading)
            .padding(.leading, 30)
            .frame(maxWidth: 340, minHeight: 50, alignment: .leading)
            .background(accentColor)
            .cornerRadius(16)
    }
}

#Preview {
    ChoiceTextView(choiceText: "Choice")
}
