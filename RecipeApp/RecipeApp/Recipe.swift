//
//  Recipe.swift
//  RecipeApp
//
//  Created by David Santiago Jamaica Galvis on 3/11/25.
//

import Foundation

struct Recipe{
    var title: String
    var ingredients: [String]
    var notes: String?
    
    func formattedINgredients() -> String {
        return ingredients.joined(separator: ", ")
    }
}
