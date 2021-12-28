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
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor(red: 0.729411, green: 0.152941, blue: 0.17647, alpha: 1), NSAttributedString.Key.backgroundColor:UIColor(red: 1, green: 1, blue: 1, alpha: 0.9)]
        navigationController?.navigationBar.largeTitleTextAttributes = textAttributes
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
                //footerView.largeButton.imageView?.image = UIImage(named: "largeButton")
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
        } else if myColor == "Cyan"{
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
        } else if myColor == "Yellow"{
            if GameStore.shared.activePiece == "Large"{
                if GameStore.shared.allPlayers[2].largePieces.isEmpty{
                    
                } else{
                    mySize = GameStore.shared.activePiece
                }
            } else if GameStore.shared.activePiece == "Medium"{
                if GameStore.shared.allPlayers[2].mediumPieces.isEmpty{
                    
                } else{
                    mySize = GameStore.shared.activePiece
                }
            } else if GameStore.shared.activePiece == "Small"{
                if GameStore.shared.allPlayers[2].smallPieces.isEmpty{
                    
                } else{
                    mySize = GameStore.shared.activePiece
                }
            }
        } else if myColor == "Purple"{
            if GameStore.shared.activePiece == "Large"{
                if GameStore.shared.allPlayers[3].largePieces.isEmpty{
                    
                } else{
                    mySize = GameStore.shared.activePiece
                }
            } else if GameStore.shared.activePiece == "Medium"{
                if GameStore.shared.allPlayers[3].mediumPieces.isEmpty{
                    
                } else{
                    mySize = GameStore.shared.activePiece
                }
            } else if GameStore.shared.activePiece == "Small"{
                if GameStore.shared.allPlayers[3].smallPieces.isEmpty{
                    
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
            Endgame()
            // Never Call collectionView.reloadData()
            if GameStore.shared.activePlayer == "Red" {
                let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor(red: 0.729411, green: 0.152941, blue: 0.17647, alpha: 1), NSAttributedString.Key.backgroundColor:UIColor(red: 1, green: 1, blue: 1, alpha: 0.9)]
                navigationController?.navigationBar.largeTitleTextAttributes = textAttributes
            } else if GameStore.shared.activePlayer == "Cyan" {
                let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor(red: 0.0, green: 0.91372, blue: 1, alpha: 1), NSAttributedString.Key.backgroundColor:UIColor(red: 1, green: 1, blue: 1, alpha: 0.9)]
                navigationController?.navigationBar.largeTitleTextAttributes = textAttributes
            } else if GameStore.shared.activePlayer == "Yellow" {
                let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor(red: 1, green: 0.88235, blue: 0, alpha: 1), NSAttributedString.Key.backgroundColor:UIColor(red: 1, green: 1, blue: 1, alpha: 0.9)]
                navigationController?.navigationBar.largeTitleTextAttributes = textAttributes
            } else if GameStore.shared.activePlayer == "Purple" {
                let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor(red: 0.29019, green: 0.09411, blue: 0.5098, alpha: 1), NSAttributedString.Key.backgroundColor:UIColor(red: 1, green: 1, blue: 1, alpha: 0.9)]
                navigationController?.navigationBar.largeTitleTextAttributes = textAttributes
            }
            navigationItem.title = "\(GameStore.shared.activePlayer)'s Turn"
        }
    }
    
    func Endgame() {
        //Check for three in one
        for i in 0...8 {
            let currentCell = GameStore.shared.allCells[i]
            if ((currentCell[0] == currentCell[1]) && (currentCell[0] == currentCell[2]) && currentCell[0] != "") {
                //Alert("Red Wins!")
                DisplayEndgameAlert(winner: currentCell[0])
                return
            }
        }
        //Check for rows & columns
        for i in 0...2 {
            //Check same Size rows
            if ((GameStore.shared.allCells[i*3][0] != "") &&
                (GameStore.shared.allCells[i*3][0] == GameStore.shared.allCells[(i*3)+1][0]) &&
                (GameStore.shared.allCells[i*3][0] == GameStore.shared.allCells[(i*3)+2][0])) {
                DisplayEndgameAlert(winner: GameStore.shared.allCells[i*3][0])
                return
            }
            if ((GameStore.shared.allCells[i*3][1] != "") &&
                (GameStore.shared.allCells[i*3][1] == GameStore.shared.allCells[(i*3)+1][1]) &&
                (GameStore.shared.allCells[i*3][1] == GameStore.shared.allCells[(i*3)+2][1])) {
                DisplayEndgameAlert(winner: GameStore.shared.allCells[i*3][1])
                return
            }
            if ((GameStore.shared.allCells[i*3][2] != "") &&
                (GameStore.shared.allCells[i*3][2] == GameStore.shared.allCells[(i*3)+1][2]) &&
                (GameStore.shared.allCells[i*3][2] == GameStore.shared.allCells[(i*3)+2][2])) {
                DisplayEndgameAlert(winner: GameStore.shared.allCells[i*3][2])
                return
            }
            
            //Check decreasing Size rows
            if ((GameStore.shared.allCells[i*3][0] != "") &&
                (GameStore.shared.allCells[i*3][0] == GameStore.shared.allCells[(i*3)+1][1]) &&
                (GameStore.shared.allCells[i*3][0] == GameStore.shared.allCells[(i*3)+2][2])) {
                DisplayEndgameAlert(winner: GameStore.shared.allCells[i*3][0])
                return
            }
            
            //Check increasing Size rows
            if ((GameStore.shared.allCells[i*3][2] != "") &&
                (GameStore.shared.allCells[i*3][2] == GameStore.shared.allCells[(i*3)+1][1]) &&
                (GameStore.shared.allCells[i*3][2] == GameStore.shared.allCells[(i*3)+2][0])) {
                DisplayEndgameAlert(winner: GameStore.shared.allCells[i*3][2])
                return
            }

            //Check same Size Columns
            if ((GameStore.shared.allCells[i][0] != "") &&
                (GameStore.shared.allCells[i][0] == GameStore.shared.allCells[i+3][0]) &&
                (GameStore.shared.allCells[i][0] == GameStore.shared.allCells[i+6][0])) {
                DisplayEndgameAlert(winner: GameStore.shared.allCells[i][0])
                return
            }
            if ((GameStore.shared.allCells[i][1] != "") &&
                (GameStore.shared.allCells[i][1] == GameStore.shared.allCells[i+3][1]) &&
                (GameStore.shared.allCells[i][1] == GameStore.shared.allCells[i+6][1])) {
                DisplayEndgameAlert(winner: GameStore.shared.allCells[i][1])
                return
            }
            if ((GameStore.shared.allCells[i][2] != "") &&
                (GameStore.shared.allCells[i][2] == GameStore.shared.allCells[i+3][2]) &&
                (GameStore.shared.allCells[i][2] == GameStore.shared.allCells[i+6][2])) {
                DisplayEndgameAlert(winner: GameStore.shared.allCells[i][2])
                return
            }
            
            //Check decreasing Size columns
            if ((GameStore.shared.allCells[i][0] != "") &&
                (GameStore.shared.allCells[i][0] == GameStore.shared.allCells[i+3][1]) &&
                (GameStore.shared.allCells[i][0] == GameStore.shared.allCells[i+6][2])) {
                DisplayEndgameAlert(winner: GameStore.shared.allCells[i][0])
                return
            }
            
            //Check increasing Size columns
            if ((GameStore.shared.allCells[i][2] != "") &&
                (GameStore.shared.allCells[i][2] == GameStore.shared.allCells[i+3][1]) &&
                (GameStore.shared.allCells[i][2] == GameStore.shared.allCells[i+6][0])) {
                DisplayEndgameAlert(winner: GameStore.shared.allCells[i][2])
                return
            }
        }
        
        //Same Size Diagonals Downward
        if ((GameStore.shared.allCells[0][0] != "") &&
            (GameStore.shared.allCells[0][0] == GameStore.shared.allCells[4][0]) &&
            (GameStore.shared.allCells[0][0] == GameStore.shared.allCells[8][0])) {
            DisplayEndgameAlert(winner: GameStore.shared.allCells[0][0])
            return
        }
        if ((GameStore.shared.allCells[0][1] != "") &&
            (GameStore.shared.allCells[0][1] == GameStore.shared.allCells[4][1]) &&
            (GameStore.shared.allCells[0][1] == GameStore.shared.allCells[8][1])) {
            DisplayEndgameAlert(winner: GameStore.shared.allCells[0][1])
            return
        }
        if ((GameStore.shared.allCells[0][2] != "") &&
            (GameStore.shared.allCells[0][2] == GameStore.shared.allCells[4][2]) &&
            (GameStore.shared.allCells[0][2] == GameStore.shared.allCells[8][2])) {
            DisplayEndgameAlert(winner: GameStore.shared.allCells[0][2])
            return
        }
        
        //Same Size Diagonals Upward
        if ((GameStore.shared.allCells[2][0] != "") &&
            (GameStore.shared.allCells[2][0] == GameStore.shared.allCells[4][0]) &&
            (GameStore.shared.allCells[2][0] == GameStore.shared.allCells[6][0])) {
            DisplayEndgameAlert(winner: GameStore.shared.allCells[2][0])
            return
        }
        if ((GameStore.shared.allCells[2][1] != "") &&
            (GameStore.shared.allCells[2][1] == GameStore.shared.allCells[4][1]) &&
            (GameStore.shared.allCells[2][1] == GameStore.shared.allCells[6][1])) {
            DisplayEndgameAlert(winner: GameStore.shared.allCells[2][1])
            return
        }
        if ((GameStore.shared.allCells[2][2] != "") &&
            (GameStore.shared.allCells[2][2] == GameStore.shared.allCells[4][2]) &&
            (GameStore.shared.allCells[2][2] == GameStore.shared.allCells[6][2])) {
            DisplayEndgameAlert(winner: GameStore.shared.allCells[2][2])
            return
        }
        
        //Increasing Size Diagonals Downward
        if ((GameStore.shared.allCells[0][0] != "") &&
            (GameStore.shared.allCells[0][0] == GameStore.shared.allCells[4][1]) &&
            (GameStore.shared.allCells[0][0] == GameStore.shared.allCells[8][2])) {
            DisplayEndgameAlert(winner: GameStore.shared.allCells[0][0])
            return
        }
        
        //Decreasing Size Diagonals Downward
        if ((GameStore.shared.allCells[0][2] != "") &&
            (GameStore.shared.allCells[0][2] == GameStore.shared.allCells[4][1]) &&
            (GameStore.shared.allCells[0][2] == GameStore.shared.allCells[8][0])) {
            DisplayEndgameAlert(winner: GameStore.shared.allCells[0][2])
            return
        }
        
        //Increasing Size Diagonals Upward
        if ((GameStore.shared.allCells[2][0] != "") &&
            (GameStore.shared.allCells[2][0] == GameStore.shared.allCells[4][1]) &&
            (GameStore.shared.allCells[2][0] == GameStore.shared.allCells[6][2])) {
            DisplayEndgameAlert(winner: GameStore.shared.allCells[2][0])
            return
        }
        
        //Decreasing Size Diagonals Upward
        if ((GameStore.shared.allCells[2][2] != "") &&
            (GameStore.shared.allCells[2][2] == GameStore.shared.allCells[4][1]) &&
            (GameStore.shared.allCells[2][2] == GameStore.shared.allCells[6][0])) {
            DisplayEndgameAlert(winner: GameStore.shared.allCells[2][2])
            return
        }
    }
    
    func DisplayEndgameAlert(winner: String) {
        let alert = UIAlertController(title: "\(winner) Wins", message: "Play Again?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: {_ in
            self.navigationController?.popViewController(animated: true)
        }))
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: {_ in
            for player in GameStore.shared.allPlayers {
                player.largePieces = [Piece]()
                player.mediumPieces = [Piece]()
                player.smallPieces = [Piece]()
            }
        }))
        
        self.present(alert, animated: true)
    }
}

