//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Khumbongmayum Tonny on 23/06/23.
//

import SwiftUI

struct ContentView: View {
    
    let possibleMoves: [String] = [
        "👊", "✋", "✌️"
    ]
    
    @State var userChoice: String = ""
    @State var showAlert: Bool = false
    @State var score: Int = 0
    @State var pcChoice: String = ""
    @State private var userWinStatus = ""
    
    var body: some View {
        ZStack {
            
            AngularGradient(
                gradient: Gradient(colors: [.red, .green, .blue, .yellow, .purple, .teal, .purple]),
                center: .center
            )
            
            VStack {
                Spacer()
                
                Text("Rock, Paper, Scissors!")
                    .font(.title.bold())
                
                Spacer()
                Spacer()

                VStack {
                    Text("Choose your move")
                        .font(.title2.weight(.medium))
                    
                    HStack {
                        ForEach(possibleMoves, id: \.self) { move in
                            ZStack {
                                Circle()                                                .frame(width: 80, height: 80)
                                Text(move)
                                    .font(.largeTitle)
                                    .padding()
                            }
                            .onTapGesture {
                                userChoice = move
                                emojiTapped()
                            }
                        }
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: 200)
                .background(.ultraThinMaterial)
                .cornerRadius(10)
                .padding(.horizontal)
                
                Spacer()
                Spacer()

                Text("Score: \(score)")
                    .font(.title.bold())
                
                Spacer()
                Spacer()
            }
        }
        .ignoresSafeArea()
        .alert("You \(userWinStatus)", isPresented: $showAlert) {
            Button("Next") {
                nextGame()
            }
            Button("Restart", role: .cancel) {
                resetGame()
            }
        } message: {
            Text("PC: \(pcChoice) , You: \(userChoice)")
                .font(.headline)
        }
    }
    
    func emojiTapped() {
        showAlert = true
        pcChoice = possibleMoves[Int.random(in: 0...2)]
        userWinStatus = checkWin(player: userChoice, pc: pcChoice)
        updateScore()
    }
    
    func updateScore() {
        if userWinStatus == "Win" {
            score += 1
        }
    }
    
    func resetGame() {
        score = 0
        nextGame()
    }
    
    func nextGame() {
        pcChoice = possibleMoves[Int.random(in: 0...2)]
    }
    
    func checkWin(player: String, pc: String) -> String {
        switch player {
        case "👊":
            switch pc {
            case "👊":
                return "Tie"
            case "✋":
                return "Loss"
            case "✌️":
                return "Win"
            default:
                return ""
            }
        case "✋":
            switch pc {
            case "👊":
                return "Win"
            case "✋":
                return "Tie"
            case "✌️":
                return "Loss"
            default:
                return ""
            }
            
        case "✌️":
            switch pc {
            case "👊":
                return "Loss"
            case "✋":
                return "Win"
            case "✌️":
                return "Tie"
            default:
                return ""
            }
        default:
            return ""
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
