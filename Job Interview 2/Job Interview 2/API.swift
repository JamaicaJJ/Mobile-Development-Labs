//
//  API.swift
//  Job Interview 2
//
//  Created by David Santiago Jamaica Galvis on 7/17/25.
//

import Foundation

struct APIResponse: Decodable {
    let results: [User]
}



struct User : Codable,Identifiable {
    var name : Name
    var picture : String
    var gender : String
    var location : String
    var email : String
    var login : String
    var registered : String
    var dob : Date
    var phone : Int
    var cell : Int
    var id : UUID
    var nat : String
}
    
struct Name : Decodable {
        var title : String
        var first : String
        var last : String
}

struct location {
    
}
