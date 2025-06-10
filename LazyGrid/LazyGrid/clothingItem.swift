//
//  clothingItem.swift
//  LazyGrid
//
//  Created by David Santiago Jamaica Galvis on 6/6/25.
//

import Foundation
struct ClothingItem: Identifiable, Hashable {
    var id = UUID()
    let name: String
    let price: Double
    let size: String
    let color: String
}
