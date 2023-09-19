//
//  LoadingView.swift
//  TicTacToe
//
//  Created by Dragos Neacsu on 19.09.2023.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .edgesIgnoringSafeArea(.all)
            
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
                .scaleEffect(2)
        }

    }
}


