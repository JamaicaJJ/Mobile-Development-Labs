//
//  addPlayerTableViewController.swift
//  Score Keeper
//
//  Created by David Santiago Jamaica Galvis on 4/9/25.
//

import UIKit

class AddPlayerTableViewController : UITableViewController {
    
    var player: Player?
    static var playerList: [Player] = []
    
    @IBOutlet var playerNameOulet: UITextField!    
    @IBOutlet weak var scoreNumberOulet: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func saveButtomPress(_ sender: Any) {
        guard let playerName = playerNameOulet.text , !playerName.isEmpty,
              let scoreText = scoreNumberOulet.text , let score = Int(scoreText) else {
            return
        }
        
        let newPlayer = Player(id: UUID().uuidString, name: playerName, score: score)
        self.player = newPlayer 
        
        performSegue(withIdentifier: "unwindToPlayerScoreList", sender: self)
    }
}

