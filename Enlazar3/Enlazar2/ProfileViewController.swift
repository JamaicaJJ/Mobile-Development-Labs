//
//  ProfileViewController.swift
//  Enlazar2
//
//  Created by David Santiago Jamaica Galvis on 4/1/25.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var userImageOulet: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userImageOulet.layer.cornerRadius = userImageOulet.frame.width / 2
    }
}
