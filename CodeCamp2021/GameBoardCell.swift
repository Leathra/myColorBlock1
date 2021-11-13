//
//  gameBoardCell.swift
//  CodeCamp2021
//
//  Created by Wesley Schmitt on 11/12/21.
//

import UIKit

class GameBoardCell: UICollectionViewCell {
    @IBOutlet var largePiece: UIImageView!
    @IBOutlet var mediumPiece: UIImageView!
    @IBOutlet var smallPiece: UIImageView!
    @IBOutlet var myButton: UIButton!
    
    func update(piece: Piece, index: IndexPath) {
        let me = GameStore.shared.allCells[index.section*3 + index.row]
        if GameStore.shared.activePlayer == "Red" {
            if piece.size == "Large" {
                if me[0] == "" {
                    largePiece.image = UIImage(named: "largeRed")
                    GameStore.shared.allCells[index.section*3 + index.row][0] = GameStore.shared.activePlayer
                    GameStore.shared.allPlayers[0].largePieces.remove(at: 0)
                    GameStore.shared.updateActivePlayer()
                } else {
                    //largePiece.image = UIImage(systemName: "star")
                }
            } else if piece.size == "Medium" {
                if me[1] == "" {
                    mediumPiece.image = UIImage(named: "mediumRed")
                    GameStore.shared.allCells[index.section*3 + index.row][1] = GameStore.shared.activePlayer
                    GameStore.shared.allPlayers[0].mediumPieces.remove(at: 0)
                    GameStore.shared.updateActivePlayer()
                } else {
                    //mediumPiece.image = UIImage(systemName: "star")
                }
            } else if piece.size == "Small" {
                if me[2] == "" {
                    smallPiece.image = UIImage(named: "smallRed")
                    GameStore.shared.allCells[index.section*3 + index.row][2] = GameStore.shared.activePlayer
                    GameStore.shared.allPlayers[0].smallPieces.remove(at: 0)
                    GameStore.shared.updateActivePlayer()
                } else {
                    //smallPiece.image = UIImage(systemName: "star")
                }
            }
        } else if GameStore.shared.activePlayer == "Cyan" {
            if piece.size == "Large" {
                if me[0] == "" {
                    largePiece.image = UIImage(named: "largeCyan")
                    GameStore.shared.allCells[index.section*3 + index.row][0] = GameStore.shared.activePlayer
                    GameStore.shared.allPlayers[1].largePieces.remove(at: 0)
                    GameStore.shared.updateActivePlayer()
                } else {
                    //largePiece.image = UIImage(systemName: "star")
                }
            } else if piece.size == "Medium" {
                if me[1] == "" {
                    mediumPiece.image = UIImage(named: "mediumCyan")
                    GameStore.shared.allCells[index.section*3 + index.row][1] = GameStore.shared.activePlayer
                    GameStore.shared.allPlayers[1].mediumPieces.remove(at: 0)
                    GameStore.shared.updateActivePlayer()
                } else {
                    //mediumPiece.image = UIImage(systemName: "star")
                }
            } else if piece.size == "Small" {
                if me[2] == "" {
                    smallPiece.image = UIImage(named: "smallCyan")
                    GameStore.shared.allCells[index.section*3 + index.row][2] = GameStore.shared.activePlayer
                    GameStore.shared.allPlayers[1].smallPieces.remove(at: 0)
                    GameStore.shared.updateActivePlayer()
                } else {
                    //smallPiece.image = UIImage(systemName: "star")
                }
            }
        } else if GameStore.shared.activePlayer == "Yellow" {
            if piece.size == "Large" {
                if me[0] == "" {
                    largePiece.image = UIImage(named: "largeYellow")
                    GameStore.shared.allCells[index.section*3 + index.row][0] = GameStore.shared.activePlayer
                    GameStore.shared.allPlayers[2].largePieces.remove(at: 0)
                    GameStore.shared.updateActivePlayer()
                } else {
                    //largePiece.image = UIImage(systemName: "star")
                }
            } else if piece.size == "Medium" {
                if me[1] == "" {
                    mediumPiece.image = UIImage(named: "mediumYellow")
                    GameStore.shared.allCells[index.section*3 + index.row][1] = GameStore.shared.activePlayer
                    GameStore.shared.allPlayers[2].mediumPieces.remove(at: 0)
                    GameStore.shared.updateActivePlayer()
                } else {
                    //mediumPiece.image = UIImage(systemName: "star")
                }
            } else if piece.size == "Small" {
                if me[2] == "" {
                    smallPiece.image = UIImage(named: "smallYellow")
                    GameStore.shared.allCells[index.section*3 + index.row][2] = GameStore.shared.activePlayer
                    GameStore.shared.allPlayers[2].smallPieces.remove(at: 0)
                    GameStore.shared.updateActivePlayer()
                } else {
                    //smallPiece.image = UIImage(systemName: "star")
                }
            }
        } else if GameStore.shared.activePlayer == "Purple" {
            if piece.size == "Large" {
                if me[0] == "" {
                    largePiece.image = UIImage(named: "largePurple")
                    GameStore.shared.allCells[index.section*3 + index.row][0] = GameStore.shared.activePlayer
                    GameStore.shared.allPlayers[3].largePieces.remove(at: 0)
                    GameStore.shared.updateActivePlayer()
                } else {
                    //largePiece.image = UIImage(systemName: "star")
                }
            } else if piece.size == "Medium" {
                if me[1] == "" {
                    mediumPiece.image = UIImage(named: "mediumPurple")
                    GameStore.shared.allCells[index.section*3 + index.row][1] = GameStore.shared.activePlayer
                    GameStore.shared.allPlayers[3].mediumPieces.remove(at: 0)
                    GameStore.shared.updateActivePlayer()
                } else {
                    //mediumPiece.image = UIImage(systemName: "star")
                }
            } else if piece.size == "Small" {
                if me[2] == "" {
                    smallPiece.image = UIImage(named: "smallPurple")
                    GameStore.shared.allCells[index.section*3 + index.row][2] = GameStore.shared.activePlayer
                    GameStore.shared.allPlayers[3].smallPieces.remove(at: 0)
                    GameStore.shared.updateActivePlayer()
                } else {
                    //smallPiece.image = UIImage(systemName: "star")
                }
            }
        }
    }
}

//class GameBoardCell: UIViewController {
//    //var largeImage: UIImageView!
//    //var mediumImage: UIImageView!
//    override func loadView() {
//        parent?.addChild(self)
//        let largeImage = UIImageView(image: UIImage(systemName: "star.fill"))
//        view.addSubview(largeImage)
//        let largeTop = largeImage.topAnchor.constraint(equalTo: view.topAnchor)
//        let largeBottom = largeImage.bottomAnchor.constraint(equalTo: view.bottomAnchor)
//        let largeLeft = largeImage.leadingAnchor.constraint(equalTo: view.leadingAnchor)
//        let largeRight = largeImage.trailingAnchor.constraint(equalTo: view.trailingAnchor)
//        //largeImage.image = UIImage(systemName: "star.fill")
//        largeTop.isActive = true
//        largeBottom.isActive = true
//        largeLeft.isActive = true
//        largeRight.isActive = true
//
//        let mediumImage = UIImageView()
//        view.addSubview(mediumImage)
//        let mediumTop = mediumImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 8)
//        let mediumBottom = mediumImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 8)
//        let mediumLeft = mediumImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8)
//        let mediumRight = mediumImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 8)
//        mediumImage.image = UIImage(systemName: "star.fill")
//        mediumTop.isActive = true
//        mediumBottom.isActive = true
//        mediumLeft.isActive = true
//        mediumRight.isActive = true
//    }
//}
