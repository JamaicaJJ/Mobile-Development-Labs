//
//  SettingView.swift
//  Job Interview 2
//
//  Created by David Santiago Jamaica Galvis on 7/19/25.
//

import Foundation
import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var settings: SettingsModel

    var body: some View {
        Form {
            Stepper("Number of Users: \(settings.numberOfUsers)", value: $settings.numberOfUsers, in: 1...100)

            Toggle("Show Gender", isOn: $settings.showGender)
            Toggle("Show Location", isOn: $settings.showLocation)
            Toggle("Show Email", isOn: $settings.showEmail)
            Toggle("Show Login", isOn: $settings.showLogin)
            Toggle("Show Registered", isOn: $settings.showRegistered)
            Toggle("Show DOB", isOn: $settings.showDOB)
            Toggle("Show Phone", isOn: $settings.showPhone)
            Toggle("Show Cell", isOn: $settings.showCell)
            Toggle("Show ID", isOn: $settings.showID)
            Toggle("Show Nationality", isOn: $settings.showNat)
        }
        .navigationTitle("Settings")
    }
}
