//
//  WWVC_App.swift
//  WWVC.
//
//  Created by David Santiago Jamaica Galvis on 7/17/25.
//

import SwiftUI

@main
struct SwiftDataTodoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: [Task.self])
        }
    }
}
