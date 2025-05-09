//
//  ContentView.swift
//  StateBidingDemoApp
//
//  Created by David Santiago Jamaica Galvis on 5/8/25.
//

import SwiftUI

struct Game: Identifiable {
    let id = UUID()
    var name: String
    var ranking: Int
}

struct ContentView: View {
    @State var games: [Game] = [
        Game(name: "Zelda Breath of the Wild", ranking: 10)
    ]
    var body: some View {
        NavigationStack {
            List($games) { gameBinding in
                NavigationLink {
                    GameDetailView(game: gameBinding)
                } label: {
                    gameRow(game: gameBinding.wrappedValue)
                }
            }
            .navigationTitle("Games")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        
                        let emptyGame = Game(name: "", ranking: 0)
                        games.append(emptyGame)
                        
                    }label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
            func gameRow(game: Game) -> some View {
                HStack {
                    Text(game.name)
                    Spacer()
                    Text("\(game.ranking)/10")
                }
            }
        }
struct GameRow: View {
    var game: Game
    var body: some View {
        HStack {
            Text(game.name)
            Spacer()
            Text("\(game.ranking)/10")
        }
        
    }
}

#Preview {
    ContentView()
}

struct GameDetailView: View {
    @Binding var game : Game
    @State var blurMode : Bool = false
    
    var body: some View {
        List {
            TextField("Game Name", text: $game.name)
                .listRowBackground(blurMode ? Color.blue : Color.white)
            Stepper("Raking: \(game.ranking)", value: $game.ranking)
                .listRowBackground(blurMode ? Color.blue : Color.white)
            Toggle(isOn: $blurMode) {
                Text("Blue Mode!")
            }
        }
    }
}

