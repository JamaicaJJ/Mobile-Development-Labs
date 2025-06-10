//
//  ContentView.swift
//  LazyGrid
//
//  Created by David Santiago Jamaica Galvis on 6/5/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                Section(header: Text("Hats").font(.headline)) {
                    ScrollView(.horizontal) {
                        LazyHGrid(rows: [GridItem(.adaptive(minimum: 150))]) {
                            ForEach(hats) { hat in
                                Clothing(item: hat, width: 150)
                            }
                        }
                        .scrollTargetLayout()
                    }
                    .scrollTargetBehavior(.viewAligned)
                }
                .padding(.vertical, 15)
                Section("Shirt") {
                                   ScrollView(.horizontal) {
                                       LazyHGrid(
                                           rows: [
                                               GridItem(.adaptive(minimum: 90)),
                                               GridItem(.adaptive(minimum: 90))
                                           ]
                                       )
                                       {
                            ForEach(shirts) { shirt in
                                Clothing(item: shirt, width: 90)
                            }
                        }
                        .scrollTargetLayout()
                    }
                    .scrollTargetBehavior(.viewAligned)
                }
                .padding(.vertical, 20)
                Section("Pants") {
                    ScrollView(.horizontal) {
                        LazyVGrid(
                            columns: [
                                GridItem(.adaptive(minimum: 80)),
                                GridItem(.adaptive(minimum: 80)),
                                GridItem(.adaptive(minimum: 80))
                            ]
                        ) {
                            ForEach(pants) { item in
                                Clothing(item: item, width: 80)
                            }
                        }
                    }
                }
                        .scrollTargetLayout()
                    }
                    .scrollTargetBehavior(.viewAligned)
                }
            }
        }
 

        struct Clothing: View {
            let item: ClothingItem
            var width: CGFloat

            var body: some View {
                VStack {
                    Text(item.name)
                        .font(.caption)
                    Text("$\(item.price.description)")
                    Text(item.size)
                    Text(item.color)
                }
                .frame(width: width, height: width)
                .background(Color.random())
                .cornerRadius(8)
            }
        }


extension Color {
    static func random() -> Color {
        return Color(
            red: Double.random(in: 0.5...1),
            green: Double.random(in: 0.5...1),
            blue: Double.random(in: 0.5...1)
        )
    }
}
#Preview {
    ContentView()
}
