//
//  DogModel.swift
//  Random Apis
//
//  Created by David Santiago Jamaica Galvis on 5/28/25.
//

import Foundation

struct Dog : Identifiable , Equatable {
    let id = UUID()
    var name : String
    var imageData : Data
}
