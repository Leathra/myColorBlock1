//
//  MainView.swift
//  CodeCamp2021
//
//  Created by Wesley Schmitt on 11/12/21.
//

import UIKit

class MainViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "twoPlayers":
            GameStore.shared.allPlayers = []
            let player1 = Player(myColor: "Red")
            GameStore.shared.allPlayers.append(player1)
            let player2 = Player(myColor: "Cyan")
            GameStore.shared.allPlayers.append(player2)
            GameStore.shared.activePlayer = "Red"
            GameStore.shared.allCells = [
                ["","",""],["","",""],["","",""],
                ["","",""],["","",""],["","",""],
                ["","",""],["","",""],["","",""]
            ]
        case "threePlayers":
            GameStore.shared.allPlayers = []
            let player1 = Player(myColor: "Red")
            GameStore.shared.allPlayers.append(player1)
            let player2 = Player(myColor: "Cyan")
            GameStore.shared.allPlayers.append(player2)
            let player3 = Player(myColor: "Yellow")
            GameStore.shared.allPlayers.append(player3)
            GameStore.shared.activePlayer = "Red"
            GameStore.shared.allCells = [
                ["","",""],["","",""],["","",""],
                ["","",""],["","",""],["","",""],
                ["","",""],["","",""],["","",""]
            ]
        case "fourPlayers":
            GameStore.shared.allPlayers = []
            let player1 = Player(myColor: "Red")
            GameStore.shared.allPlayers.append(player1)
            let player2 = Player(myColor: "Cyan")
            GameStore.shared.allPlayers.append(player2)
            let player3 = Player(myColor: "Yellow")
            GameStore.shared.allPlayers.append(player3)
            let player4 = Player(myColor: "Purple")
            GameStore.shared.allPlayers.append(player4)
            GameStore.shared.activePlayer = "Red"
            GameStore.shared.allCells = [
                ["","",""],["","",""],["","",""],
                ["","",""],["","",""],["","",""],
                ["","",""],["","",""],["","",""]
            ]
        default:
            preconditionFailure("Unexpected segue identifier.")
        }
    }
    
}
