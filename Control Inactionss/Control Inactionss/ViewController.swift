//
//  ViewController.swift
//  Control Inactionss
//
//  Created by David Santiago Jamaica Galvis on 1/28/25.
//

import UIKit

class ViewController: UIViewController {
    let colors : [UIColor] = [.red, .green, .blue, .purple, .orange, .cyan, .cyan , .brown]
    
    
    @IBOutlet weak var colorBoton: UIButton!
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var LabelText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func colorBttonTap(_ sender:Any) {
        let randomColor = colors.randomElement()
        
        self.view.backgroundColor =
        randomColor
    }
    
    @IBAction func sombreadoColor(_ sender: UISlider) {
        self.view.alpha = CGFloat(sender.value)
    }
    
    @IBAction func switchTap(_ sender: UISwitch) {
        
        self.colorBoton.isHidden = !sender.isOn
        self.slider.isHidden = !sender.isOn
    }
    
    @IBAction func textFieldPrimaryaction(_ sender: UITextField) {
        
        self.LabelText.text = sender.text
        self.LabelText.textColor = .red
        
    }
    
    
}

