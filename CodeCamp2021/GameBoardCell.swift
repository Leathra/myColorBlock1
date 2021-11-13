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
    
    func update(piece: Piece, player: Player, index: IndexPath) {
        let me = GameStore.shared.allCells[index.section][index.row]
        if piece.size == "Large" {
            if me[0] == "" {
                largePiece.image = UIImage(systemName: "star.fill")
                GameStore.shared.allCells[index.section][index.row][0] = player.color
                GameStore.shared.allPlayers[0].pieces.remove(at: 0)
            } else {
                largePiece.image = UIImage(systemName: "star")
            }
        } else if piece.size == "Medium" {
            if me[1] == "" {
//                let firstMediumPiece = GameStore.shared.allPlayers[0].pieces.firstIndex { Piece in
//                }
                mediumPiece.image = UIImage(systemName: "star.fill")
                GameStore.shared.allCells[index.section][index.row][1] = player.color
            } else {
                mediumPiece.image = UIImage(systemName: "star")
            }
        } else if piece.size == "Small" {
            if me[2] == "" {
                smallPiece.image = UIImage(systemName: "star.fill")
                GameStore.shared.allCells[index.section][index.row][2] = player.color
                GameStore.shared.allPlayers[0].pieces.popLast()
            } else {
                smallPiece.image = UIImage(systemName: "star")
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
