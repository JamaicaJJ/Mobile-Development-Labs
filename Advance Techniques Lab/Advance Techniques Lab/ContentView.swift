//
//  ContentView.swift
//  Advance Techniques Lab
//
//  Created by David Santiago Jamaica Galvis on 6/9/25.
//

import SwiftUI

enum LoginState {
    case idle , loading , succes(String) , error(String)
}

struct ContentView: View {
    let contrasena = "Fierce"
    @State private var username : String = ""
    @State private var password : String = ""
    @State private var loginState: LoginState = .idle

    
    var body: some View {
            ZStack {
                Color.black.ignoresSafeArea()

                VStack(spacing: 20) {
                    Text("Login")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding(.top, 100)

                    TextField("Username", text: $username)
                        .padding()
                        .background(Color.gray)
                        .cornerRadius(12)
                    
                    TextField("Password", text: $password)
                        .padding()
                        .background(Color.gray)
                        .cornerRadius(12)

                    if case .loading = loginState {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .white))
                    }

                    if case .error(let message) = loginState {
                        Text(message)
                            .foregroundColor(.red)
                            .padding(.top, 10)
                    }
                    if case .succes(let message) = loginState {
                        Text(message)
                            .foregroundColor(.green)
                            .padding(.top, 10)
                    }

                    Button("Login") {
                        handleLogin()
                    }
                    .buttonStyle(CustomButtonStyle())

                    Spacer()
                }
                .padding()
            }
        }

        func handleLogin() {
            loginState = .loading
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                if password == contrasena {
                    loginState = .succes("Correct")
                } else {
                    loginState = .error("Incorrect password. Try again.")
                }
            }
        }
    }



#Preview {
    ContentView()
}
