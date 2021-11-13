//
//  Player.swift
//  CodeCamp2021
//
//  Created by Wesley Schmitt on 11/12/21.
//

import UIKit

class Player {
    var largePieces: [Piece]
    var mediumPieces: [Piece]
    var smallPieces: [Piece]
    var color: String
    
    init (myColor: String) {
        self.largePieces = []
        self.mediumPieces = []
        self.smallPieces = []
        self.color = myColor
        for _ in 0..<3 {
            let newPiece = Piece(size: "Large", color: myColor)
            largePieces.append(newPiece)
        }
        for _ in 0..<3 {
            let newPiece = Piece(size: "Medium", color: myColor)
            mediumPieces.append(newPiece)
        }
        for _ in 0..<3 {
            let newPiece = Piece(size: "Small", color: myColor)
            smallPieces.append(newPiece)
        }
    }
    
    convenience init () {
        self.init(myColor: "Red")
    }
}
