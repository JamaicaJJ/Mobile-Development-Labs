//
//  PhotoInfoController.swift
//  RandomAPIS
//
//  Created by David Santiago Jamaica Galvis on 5/1/25.
//

import Foundation

enum PhotoInfoError: Error, LocalizedError {
    case itemNotFound
}


func fetchPhotoInfo() async throws -> PhotoInfo {
    let url = URL(string: "https://dog.ceo/api/breeds/image/random")!

    let (data, response) = try await URLSession.shared.data(from: url)

    guard let httpResponse = response as? HTTPURLResponse,
          httpResponse.statusCode == 200 else {
        throw PhotoInfoError.itemNotFound
    }

    let jsonDecoder = JSONDecoder()
    let photoInfo = try jsonDecoder.decode(PhotoInfo.self, from: data)
    return photoInfo
}

