//
//  settingView.swift
//  DragonDex
//
//  Created by David Santiago Jamaica Galvis on 6/2/25.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var settings: AppSettings

    var body: some View {
        VStack {
            Text("Choose Background Color")
                .font(.headline)

            ColorPicker("Background", selection: $settings.backgroundColor)
                .padding()

            Spacer()
        }
        .padding()
        .background(settings.backgroundColor)
    }
}
