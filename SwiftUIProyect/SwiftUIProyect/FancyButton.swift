//
//  FancyButton.swift
//  SwiftUIProyect
//
//  Created by David Santiago Jamaica Galvis on 5/6/25.
//

// FancyButton.swift
import SwiftUI

struct FancyButton: View {
    var sport: Sport
    @Binding var selectedSport: Sport?

    var body: some View {
        Button {
            selectedSport = sport
        } label: {
            Text(sport.name)
                .foregroundColor(.white)
                .padding()
                .frame(width: 100, height: 100)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(selectedSport == sport ? Color.green.opacity(0.7) : Color.green)
                )
        }
    }
}
