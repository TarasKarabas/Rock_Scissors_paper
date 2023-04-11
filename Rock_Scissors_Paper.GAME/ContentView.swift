//
//  ContentView.swift
//  Rock_Scissors_Paper.GAME
//
//  Created by Taras Kyparenko on 7/4/2023.
//

import SwiftUI

struct ContentView: View {
    
    let moves = ["✊", "✋", "✌️"]
    
    @State private var computerChoice = Int.random(in: 0..<3)
    @State private var result = ""
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.blue, .mint]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack{
                Text("GOOD LUCK !!!")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                
                VStack{
                    Text("PC")
                        .font(.largeTitle.bold())
                        .foregroundColor(.white)
                    Text("PLAYER")
                        .font(.footnote.italic())
                        .foregroundColor(.white)
                    
                    Text(moves[computerChoice])
                        .font(.system(size: 200))
                }
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding(20)
                
                Spacer()
                Text("\(result)")
                    .font(.largeTitle.weight(.heavy).width(.condensed))
                    .foregroundColor(.red)
                    .rotationEffect(.degrees(35))
                
                Spacer()
                VStack{
                    Text("Make a choice...")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                }
                
                HStack {
                    ForEach(0..<3) { number in
                        Button(moves[number]) {
                            play(choice: number)
                        }
                        
                        .font(.system(size: 80))
                        .background(in: RoundedRectangle(cornerRadius: 15))
                        .backgroundStyle(.ultraThinMaterial)
                    }
                }
                Spacer()
            }
        }
    }
    
    func play(choice: Int) {
        computerChoice = Int.random(in: 0..<3)
        
        if choice == 0 && computerChoice == 0 {
            result = "DRAW"
        } else if choice == 0 && computerChoice == 1 {
            result = "YOU are LOSER 👎"
        } else if choice == 0 && computerChoice == 2 {
            result = "YOU WIN 👏"
        } else if choice == 1 && computerChoice == 0 {
            result = "YOU WIN 👏"
        } else if choice == 1 && computerChoice == 1 {
            result = "DRAW"
        } else if choice == 1 && computerChoice == 2 {
            result = "YOU are LOSER 👎"
        } else if choice == 2 && computerChoice == 0 {
            result = "YOU are LOSER 👎"
        } else if choice == 2 && computerChoice == 1 {
            result = "YOU WIN 👏"
        } else if choice == 2 && computerChoice == 2 {
            result = "DRAW"
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
