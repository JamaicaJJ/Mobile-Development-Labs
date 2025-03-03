//
//  ViewController.swift
//  Delegation Practice
//
//  Created by David Santiago Jamaica Galvis on 3/3/25.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var largeTextView: UITextView!
    let bannedWords = ["badword1", "badword2", "badword3"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        largeTextView.delegate = self
     
    }
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool{
        
        if text.isEmpty {
            return true
        }
        
        let wholeText = textView.text! + text
        
        if bannedWords.contains(wholeText){
            return false
        }
        
        return true
    }

}

