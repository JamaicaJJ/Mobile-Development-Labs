//
//  MenuItem.swift
//  OrderApp
//
//  Created by David Santiago Jamaica Galvis on 5/12/25.
//

import Foundation

// MenuResponse holds an array of MenuItem objects
struct MenuResponse: Codable {
    let items: [MenuItem]
}

// MenuItem represents the individual menu item
struct MenuItem: Codable {
    var id: Int
    var name: String
    var detailText: String
    var price: Double
    var category: String
    var imageURL: URL

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case detailText = "description"
        case price
        case category
        case imageURL = "image_url"
    }
}
