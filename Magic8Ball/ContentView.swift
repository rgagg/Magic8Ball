//
//  ContentView.swift
//  Magic8Ball
//
//  Created by Richard Gagg on 12/2/2025.
//

import SwiftUI

struct ContentView: View {
  @State private var predictMessage: String = ""
  @State private var newMessageIndex: Int = -1
  @State private var lastMessageIndex: Int = -1
  
  private let choicesArray: [String] = [
    "It is certain",
    "It is decidedly so",
    "Without a doubt",
    "Yes, definitely",
    "You may rely on it",
    "As I see it, yes",
    "Most likely",
    "Outlook good",
    "Yes",
    "Signs point to yes",
    "Reply hazy try again",
    "Ask again later",
    "Better not tell you now",
    "Cannot predict now",
    "Concentrate and ask again",
    "Don't count on it",
    "My reply is no",
    "My sources say no",
    "Outlook not so good",
    "Very doubtful"]
  
  var body: some View {
    VStack {
      Spacer()
      
      Image("predict-ball-image")
        .resizable()
        .scaledToFit()
        .frame(width: 350, height: 350)
      
      Text(predictMessage)
        .font(.largeTitle)
        .multilineTextAlignment(.center)
        .minimumScaleFactor(0.5)
        .frame(height: 120)
        .animation(
          .easeInOut(duration: 0.5)
          .delay(0.25),
          value: predictMessage
        )
      Spacer()
      
      Button {
        
        repeat {
          newMessageIndex = Int.random(in: 0...choicesArray.count - 1)
        } while lastMessageIndex == newMessageIndex
        
        predictMessage = (choicesArray[newMessageIndex])
        lastMessageIndex = newMessageIndex
        
      } label: {
        Text("Hit Me!")
          .font(.title2)
      }
      .buttonStyle(.borderedProminent)
      .tint(.indigo)
      
    }
    .padding()
  }
}

#Preview {
  ContentView()
}
