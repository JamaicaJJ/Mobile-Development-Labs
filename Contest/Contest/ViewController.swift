//
//  ViewController.swift
//  Contest
//
//  Created by David Santiago Jamaica Galvis on 4/25/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var emailOulet: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func buttomPressed(_ sender: Any) {
             if let emailText = emailOulet.text, emailText.isEmpty {
            
                 UIView.animate(withDuration: 0.1, animations: {
                     self.emailOulet.transform = CGAffineTransform(translationX: 10, y: 0)
                 }) { (_) in
                     UIView.animate(withDuration: 0.1, animations: {
                         self.emailOulet.transform = CGAffineTransform.identity
                     })
                 }
             } else {
                 performSegue(withIdentifier: "enterContest", sender: self)
             }
         }
     }
