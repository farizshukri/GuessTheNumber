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
    @State private var usePastelColors = false
    
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
            
            Toggle("Use Pastel Background", isOn: $usePastelColors)
                .padding()
            
        }
        .background(usePastelColors ? pastelColor() : Color.white)
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
    
    func pastelColor() -> Color {
        let hue = Double.random(in: 0...1)
        let saturation = Double.random(in: 0.5...0.8)
        let brightness = Double.random(in: 0.8...1.0)
        
        return Color(hue: hue, saturation: saturation, brightness: brightness)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

