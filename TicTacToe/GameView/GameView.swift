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
        
        GeometryReader { geometry in
            
            VStack {
                Text(viewModel.gameNotification)
                Button {
                    dismiss.wrappedValue.dismiss()
                    viewModel.quitGame()
                } label: {
                    GameButton(title: "Quit", backgroundColor: Color(.systemRed))
                    
                }
                if viewModel.game?.player2Id == "" {
                    LoadingView()
                }
                Spacer()
                
                VStack {
                    LazyVGrid(columns: viewModel.columns, spacing: 5) {
                        ForEach(0..<9) { i in
                            ZStack {
                                GameSquareView(proxy: geometry)
                                PlayerView(imageName: viewModel.game?.moves[i]?.indicator ?? "applelogo")
                                
                            }
                            .onTapGesture {
                                viewModel.processPlayerMove(for: i)
                            }
                        }
                    }
                }
                .disabled(viewModel.checkForBoard())
                .padding()
                .alert(item: $viewModel.alertItem) { alertItem in
                    alertItem.isForQuit ? Alert(title: alertItem.title, message: alertItem.message, dismissButton: .destructive(alertItem.buttonTitle, action: {
                        self.dismiss.wrappedValue.dismiss()
                        viewModel.quitGame()
                    }))
                    : Alert(title: alertItem.title, message: alertItem.message, primaryButton: .default(alertItem.buttonTitle, action: {
                        viewModel.restGame()
                    }), secondaryButton: .destructive(Text("Quit"), action: {
                        self.dismiss.wrappedValue.dismiss()
                        viewModel.quitGame()
                    }))
                    
                }
            }
        }.onAppear{
            viewModel.getTheGame()
        }
        
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(viewModel: GameViewModel())
    }
}
