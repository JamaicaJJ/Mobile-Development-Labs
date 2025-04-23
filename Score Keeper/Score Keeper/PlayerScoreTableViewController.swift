//
//  PlayerScoreTableViewController.swift
//  Score Keeper
//
//  Created by David Santiago Jamaica Galvis on 4/10/25.
//

import UIKit

class PlayerScoreTableViewController: UITableViewController, ScoreTableViewCell.ScoreTableViewCellDelegate {


    var players : [Player] = []
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
}
    func sortPlayersByScore() {
        players.sort { $0.score > $1.score }
    }

    func scoreDidChange(for cell: ScoreTableViewCell, newScore: Int) {
        if let player = cell.player,
           let oldIndexPath = players.firstIndex(where: { $0.id == player.id }) {
            players[oldIndexPath].score = newScore
            sortPlayersByScore()
            guard let newIndexPath = players.firstIndex(where: { $0.id == player.id }) else { return }
            
            tableView.beginUpdates()
            tableView.moveRow(at: IndexPath(row: oldIndexPath, section: 0), to: IndexPath(row: newIndexPath, section: 0))
            tableView.endUpdates()
        }
    }
    
    @IBAction func unwindToPlayerScoreList(segue: UIStoryboardSegue) {
    if let sourceVC = segue.source as? AddPlayerTableViewController,
       let newPlayer = sourceVC.player {
        players.append(newPlayer)
        sortPlayersByScore()
        tableView.reloadData()
    }
}

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return players.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "scoreCell", for: indexPath) as! ScoreTableViewCell
        let player = players[indexPath.row]
        cell.update(with: player)
        cell.delegate = self
        return cell
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if let destinationVC = segue.destination as? PlayerScoreTableViewController {
             destinationVC.players = self.players
         }
     }
 }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

