//
//  ViewController.swift
//  CodeCamp2021
//
//  Created by Wesley Schmitt on 11/12/21.
//

import UIKit

class GameViewController: UICollectionViewController, UIGestureRecognizerDelegate {
    //var gameStore: GameStore!

    override func viewDidLoad() {
        super.viewDidLoad()
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
        
        navigationItem.title = "\(GameStore.shared.activePlayer)'s Turn"
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let identifier = "gameBoardCell"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! GameBoardCell
        cell.myButton.tag = indexPath.section*3 + indexPath.row
        cell.myButton.addTarget(self, action: #selector(self.handleTouchUpInside), for: .touchUpInside)
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if (kind == UICollectionView.elementKindSectionFooter){
            let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "playerViewCell", for: indexPath) as! PlayerViewCell
            if (indexPath.section == 2) {
                    // Customize footerView here
                    return footerView
            }
            footerView.isHidden = true
            let myHeight = footerView.heightAnchor.constraint(equalToConstant: 10)
            myHeight.isActive = true
            return footerView
        }
        fatalError()
    }
    
    @objc func handleTouchUpInside(sender: UIButton) {
        let row = sender.tag%3
        let section = sender.tag/3

        //if let indexPath = self.collectionView.indexPathForItem(at: pos) {}
        let indexPath = IndexPath(row: row, section: section)
        let cell = self.collectionView.cellForItem(at: indexPath) as! GameBoardCell
        let myColor = GameStore.shared.activePlayer
        var mySize = ""
        if myColor == "Red"{
            if GameStore.shared.activePiece == "Large"{
                if GameStore.shared.allPlayers[0].largePieces.isEmpty{
                    
                } else{
                    mySize = GameStore.shared.activePiece
                }
            } else if GameStore.shared.activePiece == "Medium"{
                if GameStore.shared.allPlayers[0].mediumPieces.isEmpty{
                    
                } else{
                    mySize = GameStore.shared.activePiece
                }
            } else if GameStore.shared.activePiece == "Small"{
                if GameStore.shared.allPlayers[0].smallPieces.isEmpty{
                    
                } else{
                    mySize = GameStore.shared.activePiece
                }
            }
        } else {
            if GameStore.shared.activePiece == "Large"{
                if GameStore.shared.allPlayers[1].largePieces.isEmpty{
                    
                } else{
                    mySize = GameStore.shared.activePiece
                }
            } else if GameStore.shared.activePiece == "Medium"{
                if GameStore.shared.allPlayers[1].mediumPieces.isEmpty{
                    
                } else{
                    mySize = GameStore.shared.activePiece
                }
            } else if GameStore.shared.activePiece == "Small"{
                if GameStore.shared.allPlayers[1].smallPieces.isEmpty{
                    
                } else{
                    mySize = GameStore.shared.activePiece
                }
            }
        }
        if mySize != "" {
            let piece = Piece(size: mySize, color: myColor)
//            if GameStore.shared.allCells[section*3+row][0] != "" {
//                if GameStore.shared.allCells[section*3+row][1] != "" {
//                    piece.size = "Small"
//                } else{
//                    piece.size = "Medium"
//                }
//            }
            cell.update(piece: piece, index: indexPath)
            // Never Call collectionView.reloadData()
            navigationItem.title = "\(GameStore.shared.activePlayer)'s Turn"
        }
    }
}

