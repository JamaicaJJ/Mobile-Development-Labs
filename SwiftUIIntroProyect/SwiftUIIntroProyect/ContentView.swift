//
//  ContentView.swift
//  SwiftUIIntroProyect
//
//  Created by David Santiago Jamaica Galvis on 5/1/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack (spacing: 20){
            Text("Important Test")
                .font(.largeTitle)
            
            Spacer()
            
            Text("Summer or Winter?")
            HStack {
                    fancyButton(title: "Winter")
                    fancyButton(title: "Summer")
                }
                
                Text("Light Mode or Dark Mode?")
                HStack {
                    fancyButton(title: "Light Mode")
                    fancyButton(title: "Dark Mode")
                }
                
                Spacer()
            }
            .padding()
        }
    }
    
    
    func fancyButton(title: String) -> some View {
        Button {
            print("\(title) Tapped")
        } label: {
            Text(title)
                .padding(4)
                .frame(width: 100)
        }
        .buttonStyle(.borderedProminent)
    }

struct QuestionSectionView: View {
    
    let buttonWidth: CGFloat
    let title: String
    let answer1 : String
    let answer2 : String
    
    var body: some View {
        Text("Light Mode or Dark Mode?")
        HStack {
            fancyButton(title: "Light Mode")
            fancyButton(title: "Dark Mode")
        }
    }
        func fancyButton(title: String) -> some View {
            Button {
                print("\(title) Tapped")
            } label: {
                Text(title)
                    .padding(4)
                    .frame(width: 100)
            }
            .buttonStyle(.borderedProminent)
        }
        
    }



#Preview {
    ContentView()
}
