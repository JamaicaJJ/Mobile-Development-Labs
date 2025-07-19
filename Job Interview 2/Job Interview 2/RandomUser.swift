//
//  RandomUser.swift
//  Job Interview 2
//
//  Created by David Santiago Jamaica Galvis on 7/19/25.
//

import Foundation
import Foundation

struct RandomUserResponse: Codable {
    let results: [RandomUser]
}

struct RandomUser: Codable, Identifiable {
    var id: UUID { UUID() }

    let name: Name
    let picture: Picture
    let gender: String?
    let location: Location?
    let email: String?
    let login: Login?
    let registered: Registered?
    let dob: DOB?
    let phone: String?
    let cell: String?
    let userID: UserIdentifier?  
    let nat: String?

    enum CodingKeys: String, CodingKey {
        case name, picture, gender, location, email, login, registered, dob, phone, cell
        case userID = "id"
        case nat
    }
}



struct Name: Codable {
    let first: String
    let last: String
}

struct Picture: Codable {
    let large: String
}

struct Location: Codable {
    let city: String
    let country: String
}

struct Login: Codable {
    let username: String
}

struct Registered: Codable {
    let date: String
}

struct DOB: Codable {
    let date: String
    let age: Int
}

struct UserIdentifier: Codable {
    let name: String?
    let value: String?
}

