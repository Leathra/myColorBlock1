//
//  Player.swift
//  CodeCamp2021
//
//  Created by Wesley Schmitt on 11/12/21.
//

import UIKit

class Player {
    var pieces: [Piece]
    var color: String
    
    init (myColor: String) {
        self.pieces = []
        self.color = myColor
        for _ in 0..<3 {
            let newPiece = Piece(size: "Large", color: myColor)
            pieces.append(newPiece)
        }
        for _ in 0..<3 {
            let newPiece = Piece(size: "Medium", color: myColor)
            pieces.append(newPiece)
        }
        for _ in 0..<3 {
            let newPiece = Piece(size: "Small", color: myColor)
            pieces.append(newPiece)
        }
    }
    
    convenience init () {
        self.init(myColor: "Red")
    }
}
