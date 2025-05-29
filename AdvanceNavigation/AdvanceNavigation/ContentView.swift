//
//  ContentView.swift
//  AdvanceNavigation
//
//  Created by David Santiago Jamaica Galvis on 5/14/25.
//

import SwiftUI

struct ContentView: View {
    @State var router: RootRouter()
    @State var people: [Person] = [
        Person(fierstName: "Toby", lastName: "Younburger", age: 19, birthday: Date(), bio: "I Like PIzaa!"),
        Person(fierstName: "Harry", lastName: "Pottrt", age: 11, birthday: Date(), bio: "IM a awizzard")
    ]
    
    var body: some View {
        NavigationStack(path: $router.navigationPath) {
            List(people) { person in
                Text("\(person.fierstName)\(person.lastName)")
            }
            .padding()
            .navigationDestination(for: RootRouter.Route.self { route in router.view(for: route)
            }
        }
                .environment(router)
                                   }
                            }
#Preview {
    ContentView()
}
