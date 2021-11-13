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
        
//        let pgr : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "handleTouchUpInside:")
//        pgr.delegate = self
//        self.collectionView.addGestureRecognizer(pgr)
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
        //let piece = Piece(size: "Large", color: "Red")
        //cell.update(piece: piece, player: GameStore.shared.allPlayers[0], index: indexPath)
        return cell
    }
    
    @objc func handleTouchUpInside(sender: UIButton) {
        //let pos = sender.contextMenuInteraction!.location(in: collectionView)
        let row = sender.tag%3
        let section = sender.tag/3

        //if let indexPath = self.collectionView.indexPathForItem(at: pos) {}
        let indexPath = IndexPath(row: row, section: section)
        let cell = self.collectionView.cellForItem(at: indexPath) as! GameBoardCell
        let piece = Piece(size: "Large", color: "Red")
        if GameStore.shared.activePlayer == "Red" {
            //
        } else {
            piece.color = "Cyan"
        }
        if GameStore.shared.allCells[section*3+row][0] != "" {
            if GameStore.shared.allCells[section*3+row][1] != "" {
                piece.size = "Small"
            } else{
                piece.size = "Medium"
            }
        }
        cell.update(piece: piece, index: indexPath)
        // Never Call collectionView.reloadData()
        navigationItem.title = "\(GameStore.shared.activePlayer)'s Turn"
        }
//    @objc func handleTouchUpInside(gesture: UITapGestureRecognizer) {
//        let p = gestureRecognizer.locationInView(self.collectionView)
//        if let indexPath : NSIndexPath = (self.collectionView?.indexPathForItemAtPoint(p))!{
//                //do whatever you need to do
//        }
//    }
    
//    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//        let cell = GameStore.shared.allCells[indexPath.section][indexPath.row]
//        if let cell = self.collectionView.cellForItem(at: indexPath){
//            cell.update()
//        }
//    }

    //Check For If Player has Selected a Piece to Place

}

//class GameViewController: UIViewController {
//    override func addChild(_ childController: UIViewController) {
//        super.addChild(childController)
//    }
//}

