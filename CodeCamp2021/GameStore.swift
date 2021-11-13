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
    var activePiece = ""
    
    //Switch to private init if singleton
    private init() {
        self.allCells = [
            ["","",""],["","",""],["","",""],
            ["","",""],["","",""],["","",""],
            ["","",""],["","",""],["","",""]
        ]
        self.allPlayers = []
    }
    
    func updateActivePlayer() { // red, cyan, yellow, purple
        //if varying multiplayer enabled, cycle through allPlayers and get colors
        if allPlayers.count == 4 {
            if self.activePlayer == "Red" {
                self.activePlayer = "Cyan"
            } else if self.activePlayer == "Cyan" {
                self.activePlayer = "Yellow"
            } else if self.activePlayer == "Yellow" {
                self.activePlayer = "Purple"
            } else if self.activePlayer == "Purple" {
                self.activePlayer = "Red"
            }
        } else if allPlayers.count == 3 {
            if self.activePlayer == "Red" {
                self.activePlayer = "Cyan"
            } else if self.activePlayer == "Cyan" {
                self.activePlayer = "Yellow"
            } else if self.activePlayer == "Yellow" {
                self.activePlayer = "Red"
            }
        } else if allPlayers.count == 2 {
            if self.activePlayer == "Red" {
                self.activePlayer = "Cyan"
            } else if self.activePlayer == "Cyan" {
                self.activePlayer = "Red"
            }
        }
    }
}
