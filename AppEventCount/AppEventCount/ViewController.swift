//
//  ViewController.swift
//  AppEventCount
//
//  Created by David Santiago Jamaica Galvis on 3/5/25.
//

import UIKit

class ViewController: UIViewController {
    var appDelegate = (UIApplication.shared.delegate as! AppDelegate)
    func updateView () {
        didFinishLaunchingLabel.text = "The App has launched \(appDelegate.launchCount) time(s)";
        configurationForConnectingLabel.text = "The App has launched \(appDelegate.launchCount) time(s)";
        willConnectLabel.text = "The App has launched \(appDelegate.launchCount) time(s)";
        sceneDidBecomeActiveLabel.text = "The App has launched \(appDelegate.launchCount) time(s)";
        sceneWillResignActiveLabel.text = "The App has launched \(appDelegate.launchCount) time(s)";
        willEnterForegroundLabel.text = "The App has launched \(appDelegate.launchCount) time(s)";
        sceneDidEnterBackgroundLabel.text = "The App has launched \(appDelegate.launchCount) time(s)";
    }
    
    @IBOutlet weak var didFinishLaunchingLabel: UILabel!
    var didFinishCount = 0
    
    @IBOutlet weak var configurationForConnectingLabel: UILabel!
    var configurationForCount = 0
    
    @IBOutlet weak var willConnectLabel: UILabel!
    
    var willConnectCount = 0

    @IBOutlet weak var sceneDidBecomeActiveLabel: UILabel!
    var sceneDidBecomeCount = 0
    
    @IBOutlet weak var sceneWillResignActiveLabel: UILabel!
    var sceneceWillResign = 0
    
    @IBOutlet weak var willEnterForegroundLabel: UILabel!
    var willEntercount = 0
    
    @IBOutlet weak var sceneDidEnterBackgroundLabel: UILabel!
    var sceneBackground = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

