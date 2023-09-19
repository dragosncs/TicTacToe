//
//  GameSquareView.swift
//  TicTacToe
//
//  Created by Dragos Neacsu on 19.09.2023.
//

import SwiftUI

struct GameSquareView: View {
    
    var proxy: GeometryProxy
    var body: some View {
        
        Circle()
            .foregroundColor(.brown.opacity(0.8))
            .frame(width: proxy.size.width / 3 - 15, height: proxy.size.width / 3 - 15)
    }
}

//struct GameSquareView_Previews: PreviewProvider {
//    static var previews: some View {
//        GameSquareView()
//    }
//}
