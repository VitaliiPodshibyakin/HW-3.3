//
//  ButtonView.swift
//  HW-3.3
//
//  Created by Виталий Подшибякин on 22.05.2022.
//

import SwiftUI

struct ButtonView: View {
    
    let text: String
    var action: () -> Void
    let color: Color
    
    var body: some View {
        Button(action: action) {
            Text("\(text)")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .frame(width: 200, height: 60)
        .background(color)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.black, lineWidth: 4)
        )
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(text: "", action: {}, color: .red)
    }
}
