//
//  postsListTableViewController.swift
//  Enlazar2
//
//  Created by David Santiago Jamaica Galvis on 3/26/25.
//

import UIKit

class postsListTableViewController: UITableViewController {
    
    var publicaciones : [Posts] = [
        Posts(title:"Thoughts on the new iPhone?", date: "02/08/2025", description: ["I think iphone should stop realizing new version every year with almost any changelles form last version "]),
        Posts(title:"Nintendo Direct", date: "03/10/2025", description: ["I hope for they to announce Super Mario Oddyssey 2"]),
        Posts(title:"NFT", date: "04/14/2025", description: ["Someone remember this moneywash thing, that they try to sell as a new kind of invesment"]),
        Posts(title:"The meme cryptocurrency", date: "5/20/2025", description: ["This memes coins really damage the image of crypto currencies specailly people start seeing it as a scam in general"]),
        Posts(title:"Vr Games Recomendations", date: "6/26/2025", description: ["Any VR games Recomendations"]),
        Posts(title:"DeepSeek", date: "7/28/2026", description: ["This new AI is way better than Chat Gpt"]),
        Posts(title:"Roblox Games", date: "8/30/2025", description: ["Im considering make one a realatable good one are very protifable "]),
        Posts(title:"Envidia Stock Price Drop", date: "9/10/2025", description: ["Why"]),
        Posts(title:"Deepseek", date: "11/22/2025", description: ["The launch of this Ai "]),
        Posts(title:"Nintendo", date: "3/20/2025", description: ["I want Super mario oddesey 2 Pls"]),
    ]
    
    
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    @IBSegueAction func displayDetails(_ coder: NSCoder, sender: Any?) -> PostsListViewController? {
        guard let cell = sender as? UITableViewCell, let indexPath = self.tableView.indexPath(for: cell) else { return nil }
        
        let post = publicaciones[indexPath.row]
        
        return PostsListViewController(post: post ,coder: coder)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return publicaciones.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath)

        let post = publicaciones[indexPath.row]
        
        var config = cell.defaultContentConfiguration()
        config.text = post.title
        
        cell.contentConfiguration = config

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
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

