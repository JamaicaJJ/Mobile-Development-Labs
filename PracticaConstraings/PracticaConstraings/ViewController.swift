//
//  ViewController.swift
//  PracticaConstraings
//
//  Created by David Santiago Jamaica Galvis on 2/11/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func lastNameActionTriggered(_ sender: Any) {
        lastNameTextField.resignFirstResponder()
    }
    
    @IBAction func helpButtomTapped(_ sender: Any) {
    self.performSegue(withIdentifier: "showDetailVC", sender: sender)
}
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetailVC"{
            if let detailVC = segue.destination as? nameDetailViewController{
                detailVC.firstName = firstNameTextField.text
                detailVC.lastName = lastNameTextField.text
                
                
            }
        }
        
        if segue.identifier == "showDetailVC2"{
            if let modalVC = segue.destination as? ModelViewController{
                modalVC = view.backgroundColor = green.
            }
        }
        
    }
    
}

