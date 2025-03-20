//
//  Athlete .swift
//  FavoriteAthlete
//
//  Created by David Santiago Jamaica Galvis on 3/13/25.
//

import Foundation
struct Athlete {
    var name : String
    var age : Int
    var league : String
    var team : String
    
    var description : String {
        return "\(name) is age \(age) years old and plays for the \(team) in the \(league)"
    }
}


