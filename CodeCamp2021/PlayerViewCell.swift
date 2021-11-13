//
//  PlayerViewCell.swift
//  CodeCamp2021
//
//  Created by Wesley Schmitt on 11/12/21.
//

import UIKit

class PlayerViewCell: UICollectionReusableView {
    @IBOutlet var largeButton: UIButton!
    @IBOutlet var mediumButton: UIButton!
    @IBOutlet var smallButton: UIButton!
    
    @IBAction func LargeButtonPressed(_ sender: UIButton) {
        GameStore.shared.activePiece = "Large"
    }
    @IBAction func MediumButtonPressed(_ sender: UIButton) {
        GameStore.shared.activePiece = "Medium"
    }
    @IBAction func SmallButtonPressed(_ sender: UIButton) {
        GameStore.shared.activePiece = "Small"
    }
}
