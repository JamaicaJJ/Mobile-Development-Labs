//
//  PlayerScoreTableViewController.swift
//  Score Keeper
//
//  Created by David Santiago Jamaica Galvis on 4/10/25.
//

import UIKit

class PlayerScoreTableViewController: UITableViewController, ScoreTableViewCell.ScoreTableViewCellDelegate {
    
    var winnerName: String?
    
    var sortOrder: SortOrder = .highToLow
    var winnerType: WinnerType = .highest
    
    enum SortOrder {
        case highToLow
        case lowToHigh
    }
    
    enum WinnerType {
        case highest
        case lowest
    }
    
    var players : [Player] = []
    var gameName : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
        
        if let name = gameName,
           let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? AddGameTableViewCell {
            cell.gameNameTextField.text = name
        }

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
            tableView.moveRow(at: IndexPath(row: oldIndexPath, section: 1), to: IndexPath(row: newIndexPath, section: 1))
            tableView.endUpdates()
        }
    }
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        if let addGameCell = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? AddGameTableViewCell {
            gameName = addGameCell.gameNameTextField.text

                  let sortedPlayers: [Player]
                  switch winnerType {
                  case .highest:
                      sortedPlayers = players.sorted { $0.score > $1.score }
                  case .lowest:
                      sortedPlayers = players.sorted { $0.score < $1.score }
                  }

                  if let topPlayer = sortedPlayers.first {
                      winnerName = topPlayer.name
                  }

                  performSegue(withIdentifier: "unwindToGames", sender: self)
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
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
            return section == 0 ? 1 : players.count
        }
    
    func sortPlayers() {
        switch sortOrder {
        case .highToLow:
            players.sort { $0.score > $1.score }
        case .lowToHigh:
            players.sort { $0.score < $1.score }
        }
    }

    
    
    @objc func sortSegmentChanged(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            sortOrder = .highToLow
        } else {
            sortOrder = .lowToHigh
        }
        sortPlayers()
        tableView.reloadSections(IndexSet(integer: 1), with: .automatic)
    }

    @objc func winnerSegmentChanged(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            winnerType = .highest
        } else {
            winnerType = .lowest
        }
    }



    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "addGameCell", for: indexPath) as! AddGameTableViewCell

            cell.sortPlayerOulet.addTarget(self, action: #selector(sortSegmentChanged(_:)), for: .valueChanged)
            cell.winningOulet.addTarget(self, action: #selector(winnerSegmentChanged(_:)), for: .valueChanged)

            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "scoreCell", for: indexPath) as! ScoreTableViewCell
            let player = players[indexPath.row]
            cell.update(with: player)
            cell.delegate = self
            return cell
        }
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

