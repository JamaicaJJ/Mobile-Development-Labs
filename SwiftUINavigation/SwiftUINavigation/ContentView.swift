//
//  ContentView.swift
//  SwiftUINavigation
//
//  Created by David Santiago Jamaica Galvis on 5/7/25.
//

import SwiftUI

struct ContentView: View{
    enum Tab: String {
        case first
        case second
    }
    @State var selectedTab = Tab.second
    @State var showSheet = false
    
    var body: some View {
        
        TabView (selection: $selectedTab) {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
                Button {
                    showSheet = true
                }label: {
                    Text("Show Sheet")
                }
                Button {
                    selectedTab = .second
                    
                }label: {
                    Text("Chnage Tabs")
                }
            }
            .padding()
            .sheet(isPresented: $showSheet){
                SecondView(isShowing:  $showSheet)
            }
            .tabItem{
                Label("First Item", systemImage: "1.circle")
            }
            .tag(Tab.first)
            SecondView(isShowing: $showSheet)
                .tabItem{
                    Label("Second Item", systemImage: "2.circle")
                }
                .tag(Tab.second)
            }
        }
    }

#Preview {
    ContentView()
}
