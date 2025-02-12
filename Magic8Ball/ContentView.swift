//
//  ContentView.swift
//  Magic8Ball
//
//  Created by Richard Gagg on 12/2/2025.
//

import SwiftUI
import UIKit

struct ContentView: View {
  @State private var predictMessage: String = ""
  @State private var newMessageIndex: Int = -1
  @State private var lastMessageIndex: Int = -1
  private let impactGenerator = UIImpactFeedbackGenerator(style: .heavy)
  
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
    ZStack {
      Color.white
        .ignoresSafeArea()
      
      VStack {
        Spacer()
        
        ZStack {
          Image("predict-ball-image")
            .resizable()
            .scaledToFit()
            .frame(width: 350, height: 350)
          
          Circle()
            .foregroundStyle(.indigo)
            .frame(height: 130)
            .offset(y: -15)
            
        
        Text(predictMessage)
          .font(.largeTitle)
          .foregroundStyle(.white)
          .multilineTextAlignment(.center)
          .minimumScaleFactor(0.4)
          .frame(width: 100, height: 100)
          .offset(y: -15)
          .animation(
            .easeInOut(duration: 0.5)
            .delay(0.25),
            value: predictMessage
          )
          
        }
        Spacer()
        
        Button {
          impactGenerator.impactOccurred()

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
}

#Preview {
  ContentView()
}
