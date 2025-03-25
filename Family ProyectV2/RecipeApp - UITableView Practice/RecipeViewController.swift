//
//  RecipeViewController.swift
//  RecipeApp - UITableView Practice
//
//  Created by Toby Youngberg on 3/12/25.
//

import UIKit

class RecipeViewController: UITableViewController {
    @IBOutlet weak var imageCell: RecipeImageCell!
    @IBOutlet weak var titleCell: UITableViewCell!
    @IBOutlet weak var ingredientCell: UITableViewCell!
    
    let recipe: familyMember
    
    init?(recipe: familyMember, coder: NSCoder) {
        self.recipe = recipe
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imageCell.recipeImageView.image = UIImage(named: recipe.Name)
        
        var titleConfig = titleCell.defaultContentConfiguration()
        titleConfig.text = recipe.Name
        titleCell.contentConfiguration = titleConfig
        
        var ingredientConfig = ingredientCell.defaultContentConfiguration()
        ingredientConfig.text = recipe.Description.joined(separator: ", ")
        ingredientCell.contentConfiguration = ingredientConfig
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
