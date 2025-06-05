//
//  Card.swift
//  GeometryReader
//
//  Created by David Santiago Jamaica Galvis on 6/3/25.
//

import Foundation
import UIKit

struct Card {
    var id = UUID()
    var photo = UIImage(systemName: "custom.person.fill")
    var name: String
    var description : String
}
