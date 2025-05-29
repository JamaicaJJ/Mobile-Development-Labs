//
//  MenuController.swift
//  OrderApp
//
//  Created by David Santiago Jamaica Galvis on 5/12/25.
//

import Foundation
import UIKit

// Define the error enum globally (outside the class)
enum MenuControllerError: Error, LocalizedError {
    case categoriesNotFound
    case menuItemsNotFound
    case orderRequestFailed
    case imageDataMissing

    var errorDescription: String? {
        switch self {
        case .categoriesNotFound:
            return "Categories not found."
        case .menuItemsNotFound:
            return "Menu items not found."
        case .orderRequestFailed:
            return "Order request failed."
        case .imageDataMissing:
            return "Failed to load image data."
        }
    }
}

typealias MinutesToPrepare = Int

class MenuController {
    static let shared = MenuController()

    static let orderUpdatedNotification = Notification.Name("MenuController.orderUpdated")

    var order = Order() {
        didSet {
            NotificationCenter.default.post(name: MenuController.orderUpdatedNotification, object: nil)
        }
    }

    let baseURL = URL(string: "http://localhost:8080/")!

    // MARK: - Fetch Categories
    func fetchCategories() async throws -> [String] {
        let categoriesURL = baseURL.appendingPathComponent("categories")
        let (data, response) = try await URLSession.shared.data(from: categoriesURL)

        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw MenuControllerError.categoriesNotFound
        }

        let decoder = JSONDecoder()
        let categoriesResponse = try decoder.decode(CategoriesResponse.self, from: data)
        return categoriesResponse.categories
    }

    // MARK: - Fetch Menu Items
    func fetchMenuItems(forCategory categoryName: String) async throws -> [MenuItem] {
        let initialMenuURL = baseURL.appendingPathComponent("menu")
        var components = URLComponents(url: initialMenuURL, resolvingAgainstBaseURL: true)!
        components.queryItems = [URLQueryItem(name: "category", value: categoryName)]
        let menuURL = components.url!

        let (data, response) = try await URLSession.shared.data(from: menuURL)

        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw MenuControllerError.menuItemsNotFound
        }

        let decoder = JSONDecoder()
        let menuResponse = try decoder.decode(MenuResponse.self, from: data)
        return menuResponse.items
    }

    // MARK: - Submit Order
    func submitOrder(forMenuIDs menuIDs: [Int]) async throws -> MinutesToPrepare {
        let orderURL = baseURL.appendingPathComponent("order")
        var request = URLRequest(url: orderURL)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let menuIdsDict = ["menuIds": menuIDs]
        let jsonEncoder = JSONEncoder()
        let jsonData = try jsonEncoder.encode(menuIdsDict)
        request.httpBody = jsonData

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw MenuControllerError.orderRequestFailed
        }

        let decoder = JSONDecoder()
        let orderResponse = try decoder.decode(OrderResponse.self, from: data)
        return orderResponse.prepTime
    }

    // MARK: - Upload Order
    func uploadOrder(forMenuIDs menuIDs: [Int]) async throws -> MinutesToPrepare {
        return try await submitOrder(forMenuIDs: menuIDs)
    }

    // MARK: - Fetch Image
    func fetchImage(from url: URL) async throws -> UIImage {
        let (data, response) = try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw MenuControllerError.imageDataMissing
        }

        guard let image = UIImage(data: data) else {
            throw MenuControllerError.imageDataMissing
        }

        return image
    }
}


