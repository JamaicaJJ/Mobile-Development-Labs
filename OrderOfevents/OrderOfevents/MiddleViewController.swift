//
//  MiddleViewController.swift
//  OrderOfevents
//
//  Created by David Santiago Jamaica Galvis on 2/10/25.
//

import UIKit

class MiddleViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    var eventNumber : Int = 1
    func addEvent (from: String){
        if let existingText = label.text {
            label.text = "\(existingText)/ Event number \(eventNumber) was \(from)"
            eventNumber += 1
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        addEvent(from: "viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addEvent(from: "viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        addEvent(from: "viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        addEvent(from: "viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        addEvent(from: "viewDidDisappear")
    }
    
    
    
}
