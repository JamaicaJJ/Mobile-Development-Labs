//
//  PersonDetail.swift
//  AdvanceNavigation
//
//  Created by David Santiago Jamaica Galvis on 5/14/25.
//

import SwiftUI

struct PersonDetail: View {
    let person: Person
    
    var body: some View {
        VStack{
            Text ("\(person.fierstName)
        /()/")
        }
}

#Preview {
    PersonDetail(person: Person(fierstName: "David", lastName: "jamaica", age: 18, birthday: Date() , bio: "I like Mario Games"))
}
