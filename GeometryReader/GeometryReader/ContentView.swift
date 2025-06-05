//
//  ContentView.swift
//  GeometryReader
//
//  Created by David Santiago Jamaica Galvis on 6/3/25.
//

import SwiftUI
struct ContentView: View {
        @Environment(\.horizontalSizeClass) var horizontalSizeClass
        @State var cards: [Card] = [
            Card(name: "Sam", description: "Cool"),
            Card(name: "Jesse", description: "Strong"),
            Card(name: "David", description: "Smart"),
            Card(name: "Hayden", description: "Nice"),
            Card(name: "Suzanne", description: "Talented"),
            Card(name: "Kaylen", description: "Thoughtful"),
            Card(name: "Jimmy", description: "Jimmy")
        ]
        
    var body: some View {
    GeometryReader { geometry in
    let columnCount = horizontalSizeClass == .compact ? 2 : 3
    let cardWidth = geometry.size.width / CGFloat(columnCount) - 16
                
    ScrollView {
    VStack(alignment: .leading, spacing: 12) {
    ForEach(0..<rows(for: cards.count, columns: columnCount), id: \.self) { rowIndex in
    HStack(spacing: 12) {
    ForEach(0..<columnCount, id: \.self) { columnIndex in
    let cardIndex = rowIndex * columnCount + columnIndex
                                    
    if cardIndex < cards.count {
    CardView(card: cards[cardIndex], width: cardWidth)
    } else {
    Spacer()
    .frame(width: cardWidth, height: 180)
                                    }
                                }
                            }
                        }
                    }
    .padding()
                }
            }
        }
        
    func rows(for itemCount: Int, columns: Int) -> Int {
            (itemCount + columns - 1) / columns
        }
    }

    struct CardView: View {
        var card: Card
        var width: CGFloat
        
        var body: some View {
            VStack(spacing: 5) {
                Image(uiImage: card.photo ??  UIImage(systemName: "person.crop.circle")!)
                    .resizable()
                    .background(Color(.blue))
                    .scaledToFit()
                    .frame(height: 70)
                    .clipShape(Circle())
                
                Text(card.name)
                    .font(.headline)
                    .foregroundColor(.primary)
                
                Text(card.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .frame(width: width, height: 196)
            .background(Color(.gray))
            .cornerRadius(15)
            .shadow(radius: 3)
        }
    }

#Preview {
    ContentView()
}
