//
//  GameView.swift
//  TicTacToe
//
//  Created by Dragos Neacsu on 18.09.2023.
//

import SwiftUI

struct GameView: View {
    let columns: [GridItem] = [GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible())]
    
    var body: some View {
        
        GeometryReader{ geometry in
            
            VStack {
                Text("Waiting for the player")
                Button {
                    print("Quit the game")
                } label: {
                    GameButton(title: "Quit", backgroundColor: Color(.systemRed))
                }
                
                LoadingView()
                Spacer()
                
                VStack {
                    LazyVGrid(columns: columns, spacing: 5) {
                        ForEach(0..<9) { i in
                            ZStack {
                                GameSquareView(proxy: geometry)
                                PlayerView(imageName: "apple.logo")
                                
                            }
                            .onTapGesture {
                                print("Useer tapped on", i)
                            }
                        }
                    }
                }
            }
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
