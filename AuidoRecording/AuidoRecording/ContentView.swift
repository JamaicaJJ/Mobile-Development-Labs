//
//  ContentView.swift
//  AuidoRecording
//
//  Created by David Santiago Jamaica Galvis on 6/25/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var recorder = AudioRecorder()
    @State private var isRecording = false

    var body: some View {
        VStack(spacing: 40) {
            Text( "Record Something")
                .font(.largeTitle)
                .bold()
                .padding(.top, 50)

            Button(action: {
                if isRecording {
                    recorder.stopRecording()
                } else {
                    recorder.startRecording()
                }
                isRecording.toggle()
            }) {
                Text(isRecording ? "Stop Recording" : "Start Recording")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(isRecording ? Color.red : Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
            }

            Button(action: {
                recorder.playRecording()
            }) {
                Text("Play Recording")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
            }

            Spacer()
        }
    }
}

#Preview {
    ContentView()
}


