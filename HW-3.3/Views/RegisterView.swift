//
//  RegisterView.swift
//  HW-3.3
//
//  Created by Виталий Подшибякин on 15.05.2022.
//

import SwiftUI

struct RegisterView: View {
    
    let data: DataManager
    @State private var userName = ""
    @State private var savedUserName: [User] = []
    @EnvironmentObject private var user: UserManager
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter your name...", text: $userName)
                    .multilineTextAlignment(.center)
                    .frame(width: 200)
                Text("\(userName.count)")
                    .foregroundColor(userName.count >= 3 ? .green : .red)

            }
            
            Button(action:{ registerUser() }) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("OK")
                }
                .disabled(userName.count >= 3 ? false : true)
            }
        }
    }
    
    private func registerUser() {
        data.save(userName, user.isRegistered) { user in
            savedUserName.append(user)
        }
        if !userName.isEmpty {
            user.name = userName
            user.isRegistered.toggle()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView(data: DataManager())
    }
}
