//
//  ContentView.swift
//  Job Interview 2
//
//  Created by David Santiago Jamaica Galvis on 7/17/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var settings = SettingsModel()

    var body: some View {
        TabView {
            UserListView()
                .tabItem {
                    Label("Users", systemImage: "person.3")
                }

            NavigationView {
                SettingsView()
            }
            .tabItem {
                Label("Settings", systemImage: "gearshape")
            }
        }
        .environmentObject(settings)
    }
}


#Preview {
    ContentView()
}
