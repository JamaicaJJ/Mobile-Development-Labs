//
//  DogList.swift
//  Random Apis
//
//  Created by David Santiago Jamaica Galvis on 5/28/25.
//

import Foundation
import SwiftUI


struct DogListCell: View {
    var dog: Dog

    var body: some View {
        HStack {
            if let image = UIImage(data: dog.imageData) {
                Image(uiImage: image)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            Text(dog.name)
                .font(.headline)
        }
    }
}

struct DogListView: View {
    @Binding var savedDogs: [Dog]

    var body: some View {
        NavigationStack {
            List {
                ForEach($savedDogs) { $dog in
                    NavigationLink(destination: DetailView(dog: $dog)) {
                        DogListCell(dog: dog)
                    }
                }
            }
            .navigationTitle("Saved Dogs")
        }
    }
}
