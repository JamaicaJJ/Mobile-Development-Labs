//
//  ViewController.swift
//  XcodeExample!
//
//  Created by David Santiago Jamaica Galvis on 1/22/25.
//

import UIKit

class ViewController: UIViewController {
    var name : String = "Bob"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        name = "Sally"
        print(name)
    }
}

