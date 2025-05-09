//
//  SecondView.swift
//  SwiftUINavigation
//
//  Created by David Santiago Jamaica Galvis on 5/7/25.
//

import SwiftUI

struct SecondView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var isShowing: Bool
    
    var body: some View {
        VStack {
            if  isShowing {
                Text("Showing")
            }
            Button {
                isShowing = false 
            }label: {
                Text("Dismiss")
            }
        }
    }
}

#Preview {
    SecondView(isShowing: .constant(true))
}
