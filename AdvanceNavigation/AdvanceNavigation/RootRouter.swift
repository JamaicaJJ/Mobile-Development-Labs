//
//  RootRouter.swift
//  AdvanceNavigation
//
//  Created by David Santiago Jamaica Galvis on 5/14/25.
//

import Foundation
import SwiftUI

@Observable
class RootRouter {
    var navigationPath = NavigationPath()
    
    enum Route: Hashable {
        case detail(person:Person)
        case settings
        
    }
        @ViewBuilder
        func view(for route: Route) -> some View {
            switch route {
            case.detail(person: let person):
                PersonDetail(person: person)
            case.settings:
                SettingsView()
            }
        }
        func navigate(to route: Route){
            navigationPath.append(route)
    }
}
