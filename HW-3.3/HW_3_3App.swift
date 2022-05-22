//
//  HW_3_3App.swift
//  HW-3.3
//
//  Created by Виталий Подшибякин on 15.05.2022.
//

import SwiftUI

@main
struct HW_3_3App: App {
    @StateObject private var userManager = UserManager()
    
    var body: some Scene {
        WindowGroup {
            StarterView()
                .environmentObject(userManager)
            RegisterView(data: DataManager())
        }
    }
}
