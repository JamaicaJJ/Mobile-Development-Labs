//
//  MenuItemTableViewCell.swift
//  OrderApp
//
//  Created by David Santiago Jamaica Galvis on 5/12/25.
//

import UIKit

class MenuItemCell: UITableViewCell {
    
     var currentImage: UIImage?

    func configure(with menuItem: MenuItem) {
        var content = defaultContentConfiguration()
        content.text = menuItem.name
        content.secondaryText = menuItem.price.formatted(.currency(code: "USD"))
        content.prefersSideBySideTextAndSecondaryText = true
        content.image = currentImage ?? UIImage(systemName: "photo.on.rectangle")
        content.imageProperties.maximumSize = CGSize(width: 40, height: 40)
        self.contentConfiguration = content
    }

    func updateImage(_ image: UIImage) {
        currentImage = image
        if (textLabel?.text) != nil {
            setNeedsUpdateConfiguration()
        }
    }


}






