//
//  AddGameTableViewCell.swift
//  Score Keeper
//
//  Created by David Santiago Jamaica Galvis on 4/18/25.
//

import UIKit

class AddGameTableViewCell: UITableViewCell {


    @IBOutlet weak var gameNameTextField: UITextField!
    
    
    @IBOutlet weak var sortPlayerOulet: UISegmentedControl!
    

    @IBOutlet weak var winningOulet: UISegmentedControl!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
