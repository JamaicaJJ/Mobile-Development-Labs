//
//  nameDetailViewController.swift
//  PracticaConstraings
//
//  Created by David Santiago Jamaica Galvis on 2/11/25.
//

import UIKit

class nameDetailViewController: UIViewController {
    
    
    
    @IBOutlet weak var firstNamelabel: UILabel!

    @IBOutlet weak var lastNameLabel: UILabel!
    
    var firstName: String?
    var lastName: String?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstNamelabel.text = firstName
        lastNameLabel.text = lastName
        
        
    }
    
    
}
