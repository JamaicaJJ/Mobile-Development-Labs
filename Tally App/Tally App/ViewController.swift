//
//  ViewController.swift
//  Tally App
//
//  Created by David Santiago Jamaica Galvis on 2/26/25.
//

import UIKit

class ViewController: UIViewController {

    // Outlets for the UI elements
    @IBOutlet weak var intervalSlider: UISlider!
    @IBOutlet weak var intervalLabel: UILabel!
    @IBOutlet weak var counterLabel: UILabel!
    
    // Counter variable
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set initial values for the slider and labels
        intervalSlider.minimumValue = 1
        intervalSlider.maximumValue = 10
        intervalSlider.value = 1
        intervalLabel.text = "Interval: 1"
        counterLabel.text = "Counter: 0"
    }
    
    // Action for slider value change
    @IBAction func intervalChanged(_ sender: UISlider) {
        // Round the slider value to the nearest integer
        let interval = Int(sender.value)
        intervalLabel.text = "Interval: \(interval)"
    }
    
    // Action for button tap
    @IBAction func incrementCounter(_ sender: UIButton) {
        // Get the interval value from the slider
        let interval = Int(intervalSlider.value)
        
        // Increment the counter by the selected interval
        counter += interval
        
        // Update the counter label
        counterLabel.text = "Counter: \(counter)"
    }
}
