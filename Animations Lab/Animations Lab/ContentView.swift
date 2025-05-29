//
//  ContentView.swift
//  Animations Lab
//
//  Created by David Santiago Jamaica Galvis on 5/22/25.
//

import SwiftUI

struct ContentView: View {
    @State private var text = ""
    @State private var opacity = 0.0
    @State private var scale = 1.0
    @State private var countdownStarted = false

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            VStack {
                Text(text)
                    .font(.system(size: 150))
                    .foregroundColor(.white)
                    .opacity(opacity)
                    .scaleEffect(scale)
                    .padding(.top, 300)

                Spacer()

                Button("Start Game") {
                    if  !countdownStarted {
                        countdownStarted = true
                        startCountdown()
                    }
                }
                .padding(.bottom, 100)
            }
        }
    }

    func startCountdown() {
        let numbers = ["3", "2", "1", "Go!"]

        for i in 0..<numbers.count {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i) * 1.2) {
                text = numbers[i]
                
                scale = 4
                opacity = 0.0

                withAnimation(.easeIn(duration: 0.4)) {
                    opacity = 1.0
                    scale = 0.2
                }

                if text != "Go!" {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                        withAnimation(.easeOut(duration: 0.4)) {
                            opacity = 0.0
                        }
                    }
                }
            }
        }
    }
}


#Preview {
    ContentView()
}
