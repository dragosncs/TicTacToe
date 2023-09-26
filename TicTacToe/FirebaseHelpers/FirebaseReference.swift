//
//  FirebaseReference.swift
//  TicTacToe
//
//  Created by Dragos Neacsu on 26.09.2023.
//

import Foundation
import Firebase

enum FirebaseCollectionReference: String {
    case Game
}

func FirebaseReference(_ collectionReference: FirebaseCollectionReference) -> CollectionReference {
    return Firestore.firestore().collection(collectionReference.rawValue)
}
