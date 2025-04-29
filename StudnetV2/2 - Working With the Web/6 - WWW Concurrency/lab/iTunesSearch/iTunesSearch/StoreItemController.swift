//
//  StoreItemController.swift
//  iTunesSearch
//
//  Created by David Santiago Jamaica Galvis on 4/29/25.
//

import Foundation
import UIKit
class StoreItemController : UIViewController {
    func fetchItems(matching query: [String: String]) async throws -> [StoreItem] {
        var urlComponents = URLComponents(string: "https://itunes.apple.com/search")!
        urlComponents.queryItems = query.map { URLQueryItem(name: $0.key, value: $0.value) }
        
        let (data, response) = try await URLSession.shared.data(from: urlComponents.url!)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw StoreItemError.itemsNotFound
        }
        
        let decoder = JSONDecoder()
        let searchResponse = try decoder.decode(SearchResponse.self, from: data)

        return searchResponse.results
    }
    
    
    
}
