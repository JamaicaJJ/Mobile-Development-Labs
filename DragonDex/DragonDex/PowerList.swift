//
//  PowerList.swift
//  DragonDex
//
//  Created by David Santiago Jamaica Galvis on 6/2/25.
//

import SwiftUI

struct PowersListView: View {
    var abilities: String
    @EnvironmentObject var settings: AppSettings

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Abilities")
                .font(.title2)
                .bold()

            ForEach(abilities.components(separatedBy: ","), id: \.self) { ability in
                Text(ability.trimmingCharacters(in: .whitespaces))
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
            }

            Spacer()
        }
        .padding()
        .background(settings.backgroundColor)
    }
}
