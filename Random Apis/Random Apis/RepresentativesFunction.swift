//
//  RepresentativesFunction.swift
//  Random Apis
//
//  Created by David Santiago Jamaica Galvis on 5/28/25.
//

import Foundation

struct RepresentativeResponse: Codable {
    let results: [Representative]
}

struct Representative: Codable {
    let name: String
    let party: String
    let link: String
    let state: String
}












