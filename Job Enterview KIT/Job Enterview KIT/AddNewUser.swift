//
//  AddNewUser.swift
//  Job Enterview KIT
//
//  Created by David Santiago Jamaica Galvis on 7/15/25.
//

import Foundation
import UIKit

class AddNewUser : UIViewController {
    
    @IBOutlet weak var newUserOulet: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func saveButtonPress(_ sender: Any) {
        guard let name = newUserOulet.text, !name.isEmpty else { return }
        
        let newUser = User(name: name)
        UserManager.shared.userList.append(newUser)
        
        tabBarController?.selectedIndex = 1
        
        dismiss(animated: true, completion: nil)
    }
}
