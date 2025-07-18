//
//  ViewModel.swift
//  Job Interview 2
//
//  Created by David Santiago Jamaica Galvis on 7/17/25.
//

import Foundation
class SettingsViewModel: ObservableObject {
    @Published var numberOfUsers: Int = 10
    @Published var showGender = false
    @Published var showLocation = false
    @Published var showEmail = false
    @Published var showLogin = false
    @Published var showRegistered = false
    @Published var showDOB = false
    @Published var showPhone = false
    @Published var showCell = false
    @Published var showID = false
    @Published var showNAT = false
}
