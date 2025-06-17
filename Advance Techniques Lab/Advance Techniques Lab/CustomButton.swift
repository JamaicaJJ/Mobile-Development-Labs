//
//  CustomButton.swift
//  Advance Techniques Lab
//
//  Created by David Santiago Jamaica Galvis on 6/10/25.
//

import Foundation
import SwiftUI



struct CustomButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 100, height: 20)
            .padding()
            .background(Color.blue.cornerRadius(12))
            .foregroundColor(.white)
            .shadow(color: .white,
                    radius: configuration.isPressed ? 0 : 5)
            .scaleEffect(configuration.isPressed ? 0 : 1 )
    }
}

struct CardStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color.gray)
            .cornerRadius(12)
            .shadow(color: .white, radius: 10)
    }
}


