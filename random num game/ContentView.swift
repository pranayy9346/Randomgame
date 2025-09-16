//
//  ContentView.swift
//  random num game
//
//  Created by NxtWave on 11/08/25.
//

import SwiftUI

struct ContentView: View {
    @State private var secretNumber = Int.random(in: 1...10)
    @State private var userGuess = ""
    @State private var attempts = 0
    @State private var feedback = "I’ve picked a number between 1 and 10. Can you guess it?"
    @State private var guessedCorrectly = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text("🎯 Welcome to the Number Guessing Game!")
                .font(.title2)
            Text(feedback)
            TextField("Enter your guess", text: $userGuess)
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .disabled(guessedCorrectly)
                .frame(width: 180)
            Button(guessedCorrectly ? "Play Again" : "Submit") {
                if guessedCorrectly {
                    // Reset the game
                    secretNumber = Int.random(in: 1...10)
                    attempts = 0
                    userGuess = ""
                    feedback = "I’ve picked a number between 1 and 10. Can you guess it?"
                    guessedCorrectly = false
                } else if let guess = Int(userGuess), (1...10).contains(guess) {
                    attempts += 1
                    if guess == secretNumber {
                        feedback = "✅ Correct! You guessed it in \(attempts) attempts."
                        guessedCorrectly = true
                    } else if guess < secretNumber {
                        feedback = "📉 Too low! Try again."
                    } else {
                        feedback = "📈 Too high! Try again."
                    }
                } else {
                    feedback = "⚠️ Please enter a valid number between 1 and 10!"
                }
                userGuess = ""
            }
            .padding()
            Text("Attempts: \(attempts)")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
