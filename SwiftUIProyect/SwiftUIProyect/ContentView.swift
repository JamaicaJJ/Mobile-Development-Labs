//
//  ContentView.swift
//  SwiftUIProyect
//
//  Created by David Santiago Jamaica Galvis on 5/5/25.
//

// ContentView.swift
import SwiftUI

struct ContentView: View {
    @State private var selectedSport: Sport? = nil
    @State var message: String = ""

    let sports = [
        Sport(name: "Soccer"),
        Sport(name: "Baseball"),
        Sport(name: "Golf"),
        Sport(name: "Futboll")
    ]

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack(spacing: 20) {
                Text("Favorite Sport")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding(.top, -300)

                
                }
            VStack {
                ForEach(sports) { sport in
                    FancyButton(sport: sport, selectedSport: $selectedSport)
                }
            }
            VStack {
                 Button("Select") {
                    if let selectedSport = selectedSport {
                        message = "You chose \(selectedSport.name)!"
                    } else {
                        message = "No sport selected"
                    }
                 }
                .padding()
                .background(Color.white)
                .foregroundColor(.black)
                .cornerRadius(8)
                    
            }
            .padding(.top , 500)
            Text(message)
                .foregroundColor(.white)
                .padding(.top, 700)
        }
    }
}


#Preview {
    ContentView()
}
