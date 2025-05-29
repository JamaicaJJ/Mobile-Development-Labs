//
//  ContentView.swift
//  Random Apis
//
//  Created by David Santiago Jamaica Galvis on 5/27/25.
//

import SwiftUI

struct ContentView: View {
    @State var viewModel = ViewModel()
    @State private var showDogList = false
    @FocusState private var nameFocused: Bool
    @Namespace private var animation

    var body: some View {
        NavigationStack {
            TabView {
                VStack {
                    if let data = viewModel.imageData, let image = UIImage(data: data) {
                        Image(uiImage: image)
                            .resizable()
                            .frame(width: 300, height: 300)
                            .padding()
                            .transition(.opacity.combined(with: .scale))
                    }

                    TextField("Name?", text: $viewModel.dogName)
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                        .focused($nameFocused)
                        .onTapGesture {
                            withAnimation {
                                showDogList = true
                            }
                        }

                    Button("Save And Generate New") {
                        viewModel.saveAndGenerateNewButtonTappd()
                    }
                    .padding()
                }
                .sheet(isPresented: $showDogList) {
                    DogListView(savedDogs: $viewModel.savedDogs)
                }
                .tabItem {
                    Image(systemName: "dog")
                    Text("Dogs")
                }
            }
        }
    }
}

    #Preview {
        ContentView()
    }
