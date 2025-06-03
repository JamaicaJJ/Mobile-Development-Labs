//
//  ContentView.swift
//  DragonDex
//
//  Created by David Santiago Jamaica Galvis on 5/30/25.
//

import SwiftUI

struct ContentView: View {
    @State private var dragons: [Dragon] = [
        Dragon(name: "RompeHuesos", image: "Rompehuesos", details: "They are characterized by their cruel nature. Their body is covered in a slimy purple layer to which they stick the bones of the other dragons they hunt. They use the bones as armor since without them their skin is very vulnerable. They are extremely aggressive and do not hesitate to attack any dragon they have nearby since they are always in search of more bones and can rarely be seen hunting in a pack. If they do, they will most likely try to hunt a Kaiser.", abilities: "Struendo, SkullCrasher"),
        Dragon(name: "PresionAcuatica", image: "PresionAcuatica", details: "A calm nature dragon, excellent for beginners which is characterized by its calm nature, is found on the coasts since it feeds on marine animals, has a decent strength but what stands out most is its ability to throw compressed boiling water which can cause a lot of damage", abilities: "Compression"),
        Dragon(name: "PesadillaLigera", image: "PesadillaLigera", details: "A species characterized by its lethality and sinister nature, they are very fast. They constantly eat plants with soffifers to which they are immune. They do so because when they consume them, their breath gains these properties, being able to put anyone to sleep almost instantly. They use this ability to hunt by putting their prey to sleep and then waking them up with a loud chirp, which is so loud that when they wake up, it can cause a heart attack in their victim.", abilities: "Comesuenos, Nightmare"),
        Dragon(name: "Kaiser", image: "Kaiser", details: "A very rare species due to its solitary nature, it is very difficult to find specimens of this, an unmatched strength and incredible speed, a species that stands out in all aspects, it seems to be positioned at the top of the food pyramid since by itself no species can against it more than another of its same species, its characteristic ability is its concentrated breath since it throws bursts of a bright blue color which can have different effects depending on which dragon it ate before making the attack, being very unpredictable if you find it by surprise it is not recommended to approach them, they are very aggressive, they will not hesitate to attack whatever is nearby, a species almost impossible to tame.", abilities: "ImpactoMagnus, KaiserVolley")
    ]

    @EnvironmentObject var settings: AppSettings

    var body: some View {
        NavigationStack {
            List(dragons) { dragon in
                NavigationLink(destination: DragonDetailView(dragon: dragon)) {
                    HStack {
                        Image(dragon.image)
                            .resizable()
                            .frame(width: 50, height: 50)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                        Text(dragon.name)
                            .font(.headline)
                    }
                }
            }
            .navigationTitle("DragondeX")
            .toolbar {
                NavigationLink(destination: SettingsView()) {
                    Image(systemName: "gear")
                        .imageScale(.large)
                }
            }
            .background(settings.backgroundColor)
        }
    }
}

