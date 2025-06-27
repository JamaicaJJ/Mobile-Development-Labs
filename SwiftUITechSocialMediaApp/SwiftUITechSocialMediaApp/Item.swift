//
//  Item.swift
//  SwiftUITechSocialMediaApp
//
//  Created by David Santiago Jamaica Galvis on 6/19/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
