//
//  ContentView.swift
//  GuessTheNumber
//
//  Created by FarizShukri  on 20/07/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var targetNumber = Int.random(in: 1...100)
    @State private var guessedNumber = ""
    @State private var feedbackMessage = ""
    @State private var showAlert = false
    
    var body: some View {
        VStack {
            Text("Guess the Number!")
                .font(.title)
                .padding()
            
            Text("I'm thinking of a number between 1 and 100.")
                .padding()
            
            TextField("Enter your guess", text: $guessedNumber)
                .keyboardType(.numberPad)
                .padding()
            
            Button("Submit Guess") {
                checkGuess()
            }
            .padding()
            
            Text(feedbackMessage)
            
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("You guessed it!"), message: Text("The number was \(targetNumber)."), dismissButton: .default(Text("Play Again")) {
                resetGame()
            })
        }
    }
    
    func checkGuess() {
        guard let guess = Int(guessedNumber) else {
            feedbackMessage = "Please enter a valid number."
            return
        }
        
        if guess == targetNumber {
            feedbackMessage = "You guessed it! The number was \(targetNumber)."
            showAlert = true
        } else if guess < targetNumber {
            feedbackMessage = "Higher! Try again."
        } else {
            feedbackMessage = "Lower! Try again."
        }
    }
    
    func resetGame() {
        targetNumber = Int.random(in: 1...100)
        guessedNumber = ""
        feedbackMessage = ""
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

