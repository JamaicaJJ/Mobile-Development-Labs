//
//  ViewController.swift
//  day 23
//
//  Created by David Santiago Jamaica Galvis on 1/23/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var flashlightButtom: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonTap(_ sender: Any) {
        if view .backgroundColor == .black{
            view.backgroundColor = .white
            flashlightButtom.tintColor = .yellow
        }else{
            view.backgroundColor = .black
            flashlightButtom.tintColor = .red
        }
        
        
    }
    
    
}

