//
//  GamesTableViewController.swift
//  Score Keeper
//
//  Created by David Santiago Jamaica Galvis on 4/17/25.
//

import UIKit

class GamesTableViewController: UITableViewController {
    
    var games: [Game] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Unwind Segue
    @IBAction func unwindToGamesTable(segue: UIStoryboardSegue) {
        if let sourceVC = segue.source as? PlayerScoreTableViewController,
           let newGameName = sourceVC.gameName,
           let winner = sourceVC.winnerName {
            
            let newGame = Game(name: newGameName, winner: winner, player: sourceVC.players)
            games.append(newGame)
            tableView.reloadData()
        }
    }
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "gamesCell", for: indexPath) as! GamesTableViewCell
        let game = games[indexPath.row]
        cell.gameNameOulet.text = game.name
        cell.winnerOulet.text = "Winner: \(game.winner)"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showGameDetail", sender: games[indexPath.row])
    }
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if segue.identifier == "showGameDetail",
          let destination = segue.destination as? PlayerScoreTableViewController,
        let selectedGame = sender as? Game {
        
        destination.players = selectedGame.player
         destination.gameName = selectedGame.name
        destination.winnerName = selectedGame.winner
        }
        }
        
        
        

    
    /*
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
     
     // Configure the cell...
     
     return cell
     }
     */
    
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
    
}
