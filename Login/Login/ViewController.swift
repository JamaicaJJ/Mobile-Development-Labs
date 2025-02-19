//
//  ViewController.swift
//  Login
//
//  Created by David Santiago Jamaica Galvis on 2/18/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var forgotPaswordButton: UIButton!
    
    @IBOutlet weak var forgotUsernameButton: UIButton!
    @IBOutlet weak var usernameOulet: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func forgotPaswordAction(_ sender: Any) {
        performSegue(withIdentifier: "forgotPaswordButton" , sender: sender)
    }
    @IBAction func forgotUserNameAction(_ sender: Any) {
        performSegue(withIdentifier: "forgotUsernameButton", sender: sender )
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let sender = sender as? UIButton else {return}
        if sender == forgotPaswordButton {
            segue.destination.navigationItem.title = "Forgot Password"
        } else if sender == forgotUsernameButton {
            segue.destination.navigationItem.title = "Forgot Username"
        }else {
            segue.destination.navigationItem.title =
            usernameOulet.text 
            
        }
    }
}

