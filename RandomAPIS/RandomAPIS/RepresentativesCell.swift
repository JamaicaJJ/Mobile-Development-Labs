//
//  RepresentativesCell.swift
//  RandomAPIS
//
//  Created by David Santiago Jamaica Galvis on 5/5/25.
//

import UIKit

class RepresentativesCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var partyLabel: UILabel!
    @IBOutlet weak var linkLabel: UILabel!
    
    
    func update(with rep: Representative) {
        nameLabel.text = rep.name
        partyLabel.text = rep.party
        linkLabel.text = rep.link

    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
