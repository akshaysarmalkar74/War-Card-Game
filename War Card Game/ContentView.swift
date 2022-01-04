//
//  ContentView.swift
//  War Card Game
//
//  Created by Neosoft on 01/01/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var cpuCard = "card5"
    @State var playerCard = "card9"
    @State var cpuScore = 0
    @State var playerScore = 0
    
    var body: some View {
        ZStack {
            Image("background")
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            VStack {
                Spacer()
                
                Image("logo")
                    
                Spacer()
                
                HStack {
                    
                    Spacer()
                    Image(playerCard)
                        
                    Spacer()
                    
                    Image(cpuCard)
                    Spacer()
                    
                }.padding()
                
                Spacer()
                
                Button(action: {
                    // Fetch Random Numbers
                    let cpuRandNum = Int.random(in: 2...14)
                    let playerRandNum = Int.random(in: 2...14)
                    
                    // Update Numbers
                    cpuCard = "card\(cpuRandNum)"
                    playerCard = "card\(playerRandNum)"
                    
                    // Update Score
                    if cpuRandNum > playerRandNum {
                        cpuScore += 1
                    } else if playerRandNum > cpuRandNum {
                        playerScore += 1
                    }
                }, label: {
                    Image("dealbutton")
                })
                
                Spacer()
                
                HStack {
                    Spacer()
                    VStack {
                        Text("Player")
                            .font(.headline)
                            .padding([.bottom], 10)
                        Text(String(playerScore))
                            .font(.largeTitle)
                    }
                    Spacer()
                    VStack {
                        Text("CPU")
                            .font(.headline)
                            .padding([.bottom], 10)
                        Text(String(cpuScore))
                            .font(.largeTitle)
                    }
                    Spacer()
                }
                .font(.system(size: 24))
                .padding()
                .foregroundColor(.white)
                
                Spacer()
                
            }.padding(20)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
