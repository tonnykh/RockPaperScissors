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
    
    @State var playerChoice: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ZStack {
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
                                playerChoice = move
                                emojiTapped()
                            }
                        }
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(.secondary)
                .cornerRadius(10)
                .padding(.horizontal)
                
                Spacer()
                Spacer()

                Text("Score: 0")
                    .font(.title.bold())
                
                Spacer()
                Spacer()
            }
        }
        .ignoresSafeArea()
        .alert("You WIN!", isPresented: $showAlert) {
            Button("Next") {}
            Button("Cancel", role: .cancel) {}
        } message: {
            Text("PC: ✋, You: \(playerChoice)")
                .font(.headline)
        }
    }
    
    func emojiTapped() {
        showAlert = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
