//
//  ScoreTableViewCell.swift
//  Score Keeper
//
//  Created by David Santiago Jamaica Galvis on 4/9/25.
//

import UIKit

class ScoreTableViewCell : UITableViewCell {
    @IBOutlet weak var playerNameOulet: UILabel!
    @IBOutlet weak var scoreNumberOulet: UILabel!
    
    @IBOutlet weak var stepperOulet: UIStepper!
    
    var player: Player? = nil
    
    weak var delegate: ScoreTableViewCellDelegate?
    func update(with player: Player) {
        self.player = player
        playerNameOulet.text = player.name
        scoreNumberOulet.text = "\(player.score)"
        stepperOulet.value = Double(player.score)
    }
    protocol ScoreTableViewCellDelegate: AnyObject {
        func scoreDidChange(for cell: ScoreTableViewCell, newScore: Int)
    }
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        let updatedScore = Int(sender.value)
        scoreNumberOulet.text = "\(updatedScore)"
        delegate?.scoreDidChange(for: self, newScore: updatedScore)
    }

    // Add IBAction for the stepper here:
    /// sender.value
    ///
    /// make sure you create a delegae, and the delete method should let the table view know that the score has changed and things might need to update
}

