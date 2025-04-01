//
//  postsListTableViewController.swift
//  Enlazar2
//
//  Created by David Santiago Jamaica Galvis on 3/26/25.
//

import UIKit

class postsListTableViewController: UITableViewController {
    
    var publicaciones : [Posts] = [
        Posts(title:"Thoughts on the new iPhone?", description: ["I think iphone should stop realizing new version every year with almost any changelles form last version "], date: "01/10/2025"),
        Posts(title:"Nintendo Direct", description: ["I hope for they to announce Super Mario Oddyssey 2"], date: "02/15/2025"),
        Posts(title:"NFT", description: ["Someone remember this moneywash thing, that they try to sell as a new kind of invesment"], date: "03/22/2025"),
        Posts(title:"The meme cryptocurrency", description: ["This memes coins really damage the image of crypto currencies specailly people start seeing it as a scam in general"], date: "04/30/2025"),
        Posts(title:"Vr Games Recomendations", description: ["Any VR games Recomendations"], date:"05/10/2025"),
        Posts(title:"DeepSeek", description: ["This new AI is way better than Chat Gpt"], date: "06/24/2025"),
        Posts(title:"Roblox Games",description: ["Im considering make one a realatable good one are very protifable "], date: "07/14/2025"),
        Posts(title:"Envidia Stock Price Drop", description: ["Why"], date: "08/28/2025"),
        Posts(title:"Deepseek", description: ["The launch of this Ai "], date: "09/11/2025"),
        Posts(title:"Nintendo", description: ["I want Super mario oddesey 2 Pls"], date: "10/31/2025"),
    ]
    
    
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return publicaciones.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // cast the cell as your custom cell type (so you can access the custom properties/outlets)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath)as? postsLisableViewControllerTableViewCell else {
            return UITableViewCell ()}
                                                                           
        let post = publicaciones[indexPath.row]
        
        // use the custom cell outlets here
        cell.configureCell(with: post)
        
        
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

