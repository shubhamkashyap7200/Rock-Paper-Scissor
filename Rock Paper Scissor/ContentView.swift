//
//  ContentView.swift
//  Rock Paper Scissor
//
//  Created by Shubham on 21/07/23.
//

import SwiftUI

struct ContentView: View {
    // MARK: Properties
    @State private var selectedChoice = "Rock"
    
    let playerChooseOutcome = ["Win", "Loose"]
    @State private var choices = ["Rock", "Paper", "Scissor"].shuffled()
    
    var randomComputerChoice = Int.random(in: 0...2)
    
    // MARK: UI
    var body: some View {
        NavigationStack{
            Form {
                
                // MARK: Computer Selection section
                Section {
                    Text(choices[randomComputerChoice])
                        .foregroundStyle(.primary)

                    // MARK: Computer choose whether want he will win or loose
//                    Picker("Bet", selection: $selectedOutcome) {
//                        ForEach(playerChooseOutcome, id: \.self) {
//                            Text($0)
//                        }
//                    }

                } header: {
                    Text("COMPUTER CHOICE")
                }
                
                // MARK: Player Choices
                Section {
                    
                    // MARK: Choose the options
                    HStack {
                        Spacer()
                        
                        Button("Rock") {
                            // do something when pressed
                            selectedChoice = "Rock"
                            processLogicOfGame(selectedChoice: selectedChoice)
                        }
                        .buttonStyle(.borderedProminent)
                        
                        Button("Paper") {
                            // do something when pressed
                            selectedChoice = "Paper"
                            processLogicOfGame(selectedChoice: selectedChoice)

                        }
                        .buttonStyle(.borderedProminent)

                        Button("Scissor") {
                            // do something when pressed
                            selectedChoice = "Scissor"
                            processLogicOfGame(selectedChoice: selectedChoice)

                        }
                        .buttonStyle(.borderedProminent)
                        
                        Spacer()
                    }
                } header: {
                    Text("Player chooses")
                }
                
                
                Section {
                    Text("Your score is: ???")
                } header: {
                    Text("Outcome and Score")
                }
            }
            
            .navigationTitle("Rock Paper Scissor")
        }
    }
    
    func processLogicOfGame(selectedChoice: String) {
        let computerChoice = choices[randomComputerChoice]
        if selectedChoice == computerChoice {
            print("DRAW")
        } else {
            if selectedChoice == "Rock" && computerChoice == "Paper" {
                print("LOOSE SCORE MINUS ONE")
            } else if selectedChoice == "Rock" && computerChoice == "Scissor" {
                print("WIN SCORE PLUS ONE")
            } else if selectedChoice == "Paper" && computerChoice == "Rock" {
                print("WIN SCORE PLUS ONE")
            } else if selectedChoice == "Paper" && computerChoice == "Scissor" {
                print("LOOSE SCORE MINUS ONE")
            } else if selectedChoice == "Scissor" && computerChoice == "Rock" {
                print("LOOSE SCORE MINUS ONE")
            } else if selectedChoice == "Scissor" && computerChoice == "Paper" {
                print("WIN SCORE PLUS ONE")
            }
        }
        
        choices.shuffle()
    }
}

#Preview {
    ContentView()
}
