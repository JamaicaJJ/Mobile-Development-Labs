//
//  postsLisableViewControllerTableViewCell.swift
//  Enlazar2
//
//  Created by David Santiago Jamaica Galvis on 3/31/25.
//

import UIKit

class postsLisableViewControllerTableViewCell: UITableViewCell {

    
    @IBOutlet weak var titleOulet: UILabel!
    
    @IBOutlet weak var imageOulet: UIImageView!
    
    @IBOutlet weak var descriptionOulet: UILabel!
    
    @IBOutlet weak var dateOulet: UILabel!
    
    
    
    
    func configureCell(with post: Posts) {
        titleOulet.text = post.title
        
        descriptionOulet.text = post.description.joined(separator: " ")
        
        if let image = UIImage(named: post.title) {
            imageOulet.image = image
        } else {
            imageOulet.image = UIImage(named: "defaultImage")
        }
        dateOulet.text = post.date
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    
}
