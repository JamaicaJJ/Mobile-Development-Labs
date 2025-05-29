//
//  Person.swift
//  AdvanceNavigation
//
//  Created by David Santiago Jamaica Galvis on 5/14/25.
//

import Foundation

struct Person: Identifiable, Hashable{
    let id: UUID = UUID()
    let fierstName : String
    let lastName: String
    let age: Int
    let birthday: Date
    let bio: String?
}
