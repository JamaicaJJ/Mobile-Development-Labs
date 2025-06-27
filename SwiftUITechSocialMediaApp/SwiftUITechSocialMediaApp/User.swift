//
//  User.swift
//  SwiftUITechSocialMediaApp
//
//  Created by David Santiago Jamaica Galvis on 6/19/25.
//

import Foundation

struct User: Decodable , Encodable {
    var firstName : String
    var lastName : String
    var email : String
    var userUUID: UUID
    var secret: UUID
    var userName: UUID 
}
