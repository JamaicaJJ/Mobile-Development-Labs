//
//  ViewController.swift
//  TwoButtoms
//
//  Created by David Santiago Jamaica Galvis on 1/29/25.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var textfield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func setTextButtomTapped(_ sender: Any) {
        label.text = textfield.text
    }
    
    @IBAction func clearTextButtomTapped(_ sender: Any) {
        textfield.text = ""
        label.text = ""
    }
    
}

