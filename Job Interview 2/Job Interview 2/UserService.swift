//
//  UserService.swift
//  Job Interview 2
//
//  Created by David Santiago Jamaica Galvis on 7/17/25.
//

import Foundation

class UserService {
    func fetchUsers(count: Int, completion: @escaping ([User]) -> Void) {
        let urlString = "https://randomuser.me/api/?results=\(count)"
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data {
                do {
                    let decoded = try JSONDecoder().decode(APIResponse.self, from: data)
                    DispatchQueue.main.async {
                        completion(decoded.results)
                    }
                } catch {
                    print("Decoding error:", error)
                }
            }
        }.resume()
    }
}
