//
//  DragonDexApp.swift
//  DragonDex
//
//  Created by David Santiago Jamaica Galvis on 5/30/25.
//

import SwiftUI

@main
struct DragonDexApp: App {
    @StateObject var settings = AppSettings()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(settings)
        }
    }
}


