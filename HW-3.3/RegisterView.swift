//
//  RegisterView.swift
//  HW-3.3
//
//  Created by Виталий Подшибякин on 15.05.2022.
//

import SwiftUI

struct RegisterView: View {
    @State private var userName = ""
    @EnvironmentObject private var user: UserManager
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter your name...", text: $userName)
                    .multilineTextAlignment(.center)
                
            }
            Button(action:{ registerUser() }) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("OK")
                }
            }
        }
    }
    
    private func registerUser() {
        if !userName.isEmpty {
            user.name = userName
            user.isRegistered.toggle()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}