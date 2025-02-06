//
//  ViewController.swift
//  BuildSomething2
//
//  Created by David Santiago Jamaica Galvis on 1/28/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func changeTitle(_ sender: Any) {
        mainLabel.text = "This apps Rocks!"
    }
    
}

