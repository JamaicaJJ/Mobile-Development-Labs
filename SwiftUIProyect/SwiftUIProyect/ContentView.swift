//
//  ContentView.swift
//  SwiftUIProyect
//
//  Created by David Santiago Jamaica Galvis on 5/5/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack(spacing: 20) {
                Text("Favorite Sport")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding(.top ,100)
                Spacer()
                Button {
                    //DO
                } label: {
                    Text("Hola")
                        .padding(.top , -400)
                        .padding(.trailing, 130)
                }
                Button {
                    //Do
                } label: {
                    Text("Hola")
                        .padding(.top, -350)
                        .padding(.trailing, 130)
                }
                Button {
                    //Do
                } label: {
                    Text("Noes")
                        .padding(.top , -441)
                        .padding(.trailing, -90)
                }
                Button {
                    //Do
                } label: {
                    Text("Nose")
                        .padding(.top, -390)
                        .padding(.trailing, -100)
                        .frame(width: 200)
                        .background(
                            RoundedRectangle(cornerRadius: 40)
                                .fill(.white)
                        )
                }
                }
            .foregroundStyle(.white)
            }
            
            }
        }


#Preview {
    ContentView()
}
