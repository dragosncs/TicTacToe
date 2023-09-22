//
//  PlayerView.swift
//  TicTacToe
//
//  Created by Dragos Neacsu on 19.09.2023.
//

import SwiftUI

struct PlayerView: View {
    
    var imageName: String
    
    var body: some View {
        Image(systemName: imageName)
            .resizable()
            .frame(width: 40, height: 40)
            .foregroundColor(.white)
            .opacity(imageName  == "applelogo" ? 0 : 1)
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView(imageName: "applelogo")
    }
}
