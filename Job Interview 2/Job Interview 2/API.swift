//
//  API.swift
//  Job Interview 2
//
//  Created by David Santiago Jamaica Galvis on 7/19/25.
//

import Foundation

class UserFetcher: ObservableObject {
    @Published var users: [RandomUser] = []

    func fetchUsers(count: Int) {
        guard let url = URL(string: "https://randomuser.me/api/?results=\(count)") else { return }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data {
                do {
                    let decoded = try JSONDecoder().decode(RandomUserResponse.self, from: data)
                    DispatchQueue.main.async {
                        self.users = decoded.results
                    }
                } catch {
                    print("Decoding error: \(error)")
                }
            }
        }.resume()
    }
}
