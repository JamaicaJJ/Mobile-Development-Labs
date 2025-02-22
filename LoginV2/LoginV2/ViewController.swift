//
//  ViewController.swift
//  LoginV2
//
//  Created by David Santiago Jamaica Galvis on 2/21/25.
//
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func checkPasswordButtonTapped(_ sender: UIButton) {
        if let password = passwordTextField.text {
            validatePassword(password)
        }
    }
    
    func validatePassword(_ password: String) {
        guard password.count >= 8 else {
            resultLabel.text = "Error"
            resultLabel.textColor = .red
            return
        }
        
        let specialCharacters = ",.!@#$%^&*<>?+=-"
        let containsSpecialCharacter = password.contains { specialCharacters.contains($0) }
        
        if containsSpecialCharacter {
            resultLabel.text = "Success!"
            resultLabel.textColor = .green
        } else {
            resultLabel.text = "Error"
            resultLabel.textColor = .red
        }
    }
}
