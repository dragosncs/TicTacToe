//
//  GameView.swift
//  TicTacToe
//
//  Created by Dragos Neacsu on 18.09.2023.
//

import SwiftUI

struct GameView: View {
    
    @ObservedObject var viewModel: GameViewModel
    @Environment(\.presentationMode) var dismiss: Binding<PresentationMode>

    
    var body: some View {
        
        GeometryReader{ geometry in
            
            VStack {
                Text("Waiting for the player")
                Button {
                    dismiss.wrappedValue.dismiss()
                } label: {
                    GameButton(title: "Quit", backgroundColor: Color(.systemRed))
                }
                
                LoadingView()
                Spacer()
                
                VStack {
                    LazyVGrid(columns: viewModel.columns, spacing: 5) {
                        ForEach(0..<9) { i in
                            ZStack {
                                GameSquareView(proxy: geometry)
                                PlayerView(imageName: viewModel.game.moves[i]?.indicator ?? "apple.logo")
                                
                            }
                            .onTapGesture {
                                viewModel.processPlayerMove(for: i)
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
        GameView(viewModel: GameViewModel())
    }
}
