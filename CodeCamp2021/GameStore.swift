//
//  GameStore.swift
//  CodeCamp2021
//
//  Created by Wesley Schmitt on 11/12/21.
//

import UIKit

class GameStore {
    static let shared = GameStore()
    var allPlayers = [Player]()
    var allCells = [[String]]()
    var activePlayer = ""
    var activePiece = 0
    
    //Switch to private init if singleton
    private init() {
        self.allCells = [
            ["","",""],["","",""],["","",""],
            ["","",""],["","",""],["","",""],
            ["","",""],["","",""],["","",""]
        ]
        self.allPlayers = []
    }
}
