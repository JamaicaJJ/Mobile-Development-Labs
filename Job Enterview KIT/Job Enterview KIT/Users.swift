//
//  Users.swift
//  Job Enterview KIT
//
//  Created by David Santiago Jamaica Galvis on 7/15/25.
//

import Foundation

struct User {
    var name : String
}
class UserManager {
    static let shared = UserManager()
    
    private init() {}
    
    var userList: [User] = [
        User(name: "Manu"),
        User(name: "Maria"),
        User(name: "Andrea"),
        User(name: "Alejandro")
    ]
}
