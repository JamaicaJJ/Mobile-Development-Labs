//
//  ViewController.swift
//  Enlazar2
//
//  Created by David Santiago Jamaica Galvis on 2/27/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageViewWidthConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.layer.cornerRadius = imageViewWidthConstraint.constant / 2
    }
}

