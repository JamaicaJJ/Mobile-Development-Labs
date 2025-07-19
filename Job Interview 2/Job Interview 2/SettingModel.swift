//
//  SettingModel.swift
//  Job Interview 2
//
//  Created by David Santiago Jamaica Galvis on 7/19/25.
//

import Foundation

class SettingsModel: ObservableObject {
    @Published var numberOfUsers = 10
    @Published var showGender = true
    @Published var showLocation = true
    @Published var showEmail = true
    @Published var showLogin = false
    @Published var showRegistered = false
    @Published var showDOB = false
    @Published var showPhone = false
    @Published var showCell = false
    @Published var showID = false
    @Published var showNat = false
}
