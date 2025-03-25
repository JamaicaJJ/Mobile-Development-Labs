//
//  RecipeListTableViewController.swift
//  RecipeApp - UITableView Practice
//
//  Created by Brad Forsyth on 3/11/25.
//

import UIKit

class RecipeListTableViewController: UITableViewController {
    
    var members: [familyMember] = [
        familyMember(Name: "Andrea", Age: "36", Description: ["My mom is very Sweet , She is a hairtransplant nurse , she have 15 years in experience in hairtransplant , she loves to cook, she talks alot"]),
        familyMember(Name: "Alejandro", Age: "41", Description: ["My Dad is 41 years old , He is very organied, He likes to workout , He likes to see things related to new technologies such as AI and cryptocurrencies"]),
        familyMember(Name: "Maria", Age: "17", Description: ["She is my little sister,she is very independent,She is very good at managing her money, She loves to sing and lisen music"]),
        familyMember(Name: "Emmanuel", Age: "12", Description: ["My little brother is very energetic , he likes soccer , and playing video games, and his favorite player is Cristiano Ronaldo"]),
        familyMember(Name: "Bella", Age: "36", Description: ["My dog is very cute , she is 3 years old and its like a baby she only eats and sleeps and somethimes she wants to play but she get tired very quick"]),]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//    @IBSegueAction func displayDetails(_ coder: NSCoder) -> RecipeViewController? {
//        return RecipeViewController(recipe: <#T##Recipe#>, coder: coder)
//    }
    @IBSegueAction func displayDetails(_ coder: NSCoder, sender: Any?) -> RecipeViewController? {
        guard let cell = sender as? UITableViewCell, let indexPath = self.tableView.indexPath(for: cell) else { return nil }
        
        let recipe = members[indexPath.row]
        
        return RecipeViewController(recipe: recipe ,coder: coder)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return members.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recipeCell", for: indexPath)

        let recipe = members[indexPath.row]
        
        var config = cell.defaultContentConfiguration()
        config.text = recipe.Name
        
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

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            members.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }  
    }

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
