//
//  ViewModel.swift
//  Random Apis
//
//  Created by David Santiago Jamaica Galvis on 5/29/25.
//

import Foundation
import SwiftUI
@Observable
class ViewModel {
    var imageData: Data? = nil
    var dogName = ""
    var savedDogs: [Dog] = []

    
    func saveAndGenerateNewButtonTappd() {
        saveDogIfNeeded()
        fetchNewDog()
    }
    
    func saveDogIfNeeded() {
        if let data = imageData, !dogName.isEmpty {
            let newDog = Dog(name: dogName, imageData: data)
            savedDogs.append(newDog)
            dogName = ""
        }
    }
    func fetchNewDog() {
        Task {
            do {
                let photoInfo = try await fetchPhotoInfo()
                let (data, _) = try await URLSession.shared.data(from: photoInfo.message)
                if UIImage(data: data) != nil {
                    withAnimation {
                        self.imageData = data
                    }
                }
            } catch {
                print("Failed to fetch photo: \(error)")
            }
        }
    }
}
