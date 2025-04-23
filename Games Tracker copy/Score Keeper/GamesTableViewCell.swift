//
//  GamesTableViewCell.swift
//  Score Keeper
//
//  Created by David Santiago Jamaica Galvis on 4/17/25.
//

import UIKit

class GamesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var gameNameOulet: UILabel!
    
    @IBOutlet weak var winnerOulet: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }


}
