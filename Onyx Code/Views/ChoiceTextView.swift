//
//  ChoiceTextView.swift
//  Onyx Code
//
//  Created by Kaan Çakır on 14.08.2024.
//

import SwiftUI

struct ChoiceTextView: View {
    let mainColor = Color(red: 24/255, green: 54/255, blue: 97/255)
    let accentColor = Color(red: 28/255, green: 75/255, blue: 130/255)
    let secondaryColor = Color(red: 221/255, green: 107/255, blue: 77/255)
    let choosingColor = Color(red: 218/255, green: 225/255, blue: 231/255)
    
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
