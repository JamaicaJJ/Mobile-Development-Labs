//
//  RandomUserViewController.swift
//  Job Enterview KIT
//
//  Created by David Santiago Jamaica Galvis on 7/15/25.
//

import Foundation
import UIKit

class RandomUserViewController: ViewController {
    
    var userList: [User] {
        return UserManager.shared.userList
    }

    
    
    @IBOutlet weak var userNameOulet: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    
    
    @IBAction func generateRandomUserButton(_ sender: Any){
        if let randomUser = userList.randomElement() {
            userNameOulet.text = randomUser.name
            
        }
    }
}
