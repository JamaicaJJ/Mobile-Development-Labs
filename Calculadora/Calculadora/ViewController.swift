//
//  ViewController.swift
//  Calculadora
//
//  Created by David Santiago Jamaica Galvis on 1/31/25.
//
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    // Create a String variable that holds what is supposed to be displayed on the displayLabel
    var currentValue: String = ""
    // Store the current displayed value in a second variable called "previousValue"
    var previousValue: String = ""
    // When an operator (+, -, /, *) is pressed:
    var currentOperator: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func numberButtonPressed(_ sender: UIButton) {
        if let buttonPressed = sender.titleLabel?.text {
            currentValue += buttonPressed
            displayLabel.text = currentValue
        }
    }
    @IBAction func operatorButtonPressed(_ sender: UIButton) {
        if let operatorPressed = sender.titleLabel?.text {
            previousValue = currentValue
            currentOperator = operatorPressed
            currentValue = ""
            displayLabel.text = "0"
        }
    }
    
    @IBAction func equalsButtonPressed(_ sender: UIButton) {
        if let previous = Double(previousValue), let current = Double(currentValue) {
            var result: Double = 0
            switch currentOperator {
            case "+":
                result = previous + current
            case "-":
                result = previous - current
            case "*":
                result = previous * current
            case "/":
                if current != 0 {
                    result = previous / current
                } else {
                    displayLabel.text = "Error"
                    return
                }
            default:
                break
            }
            
            displayLabel.text = "\(result)"
            currentValue = "\(result)"
            previousValue = ""
            currentOperator = ""
        }
    }
    
    @IBAction func clearButtonPressed(_ sender: UIButton) {
        currentValue = ""
        previousValue = ""
        currentOperator = ""
        displayLabel.text = "0"
    }
    @IBAction func decimalButtonPressed(_ sender: UIButton) {
        if !currentValue.contains(".") {
            currentValue += "."
            displayLabel.text = currentValue
        }
        
        
        
    }
}



