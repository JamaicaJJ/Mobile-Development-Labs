//
//  RootView.swift
//  SwiftUITechSocialMediaApp
//
//  Created by David Santiago Jamaica Galvis on 6/19/25.
//
import SwiftUI
import Foundation
 
struct RootView: View {
    @State var loggedInUser: User?
    
    var body: some View {
        if let user = loggedInUser {
            let api = API 
            NavigationStack {
                MainView()
            }
        } else {
            LoginView(loggedInUser: $loggedInUser)
        }
    }
}

struct MainView: View {
    let api: APIController
    var bod: some view {
        Text("you're signed in!")
    }
}
