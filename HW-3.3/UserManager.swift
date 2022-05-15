//
//  UserManager.swift
//  HW-3.3
//
//  Created by Виталий Подшибякин on 15.05.2022.
//

import Combine

final class UserManager: ObservableObject {
    @Published var isRegistered = false
    var name = ""
}

