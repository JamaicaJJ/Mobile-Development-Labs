//
//  DetailView.swift
//  DragonDex
//
//  Created by David Santiago Jamaica Galvis on 6/2/25.
//

import SwiftUI

struct DragonDetailView: View {
    var dragon: Dragon
    @EnvironmentObject var settings: AppSettings

    var body: some View {
       
            VStack(spacing: 20) {
                Image(dragon.image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 300)

                Text(dragon.name)
                    .font(.largeTitle)
                    .bold()

                Text(dragon.details)
                    .padding()

                NavigationLink("View Powers") {
                    PowersListView(abilities: dragon.abilities)
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
            .background(settings.backgroundColor.ignoresSafeArea())

        }
    }

