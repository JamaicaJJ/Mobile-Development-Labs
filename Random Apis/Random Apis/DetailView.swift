//
//  DetailView.swift
//  Random Apis
//
//  Created by David Santiago Jamaica Galvis on 5/28/25.
//

import SwiftUI

struct DetailView: View {
    @Binding var dog: Dog

    var body: some View {
        VStack {
            if let image = UIImage(data: dog.imageData) {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 250)
            }
            TextField("Edit name", text: $dog.name)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .padding()
        .navigationTitle("Edit Dog")
    }
}
