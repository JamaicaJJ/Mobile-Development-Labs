//
//  FoodTableViewController.swift
//  Meal Tracker
//
//  Created by David Santiago Jamaica Galvis on 3/7/25.
//

import UIKit

class FoodTableViewController: UITableViewController {
    
    var meal : [Meal] = [Meal(name: "Dinner", food: [Food(name: "Pizza", descripcion: "withou pineeaple!")]),
        Meal(name: "Breakfast", food : [Food(name: "Egg", descripcion: "Have protein")]),
                         Meal(name: "Lunch", food: [Food(name: "Steak", descripcion: "Welldone")])
                         
    ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

  

    override func numberOfSections(in tableView: UITableView) -> Int {
        return meal.count

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       1
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Food", for: indexPath)
        let meal = meal[indexPath.section]
        let food = meal.food[indexPath.row]
        
        var defaultConfig = cell.defaultContentConfiguration()
        defaultConfig.text = food.name
        defaultConfig.secondaryText = food.descripcion
        cell.contentConfiguration = defaultConfig
        
        return cell
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        meal[section].name
    }
            
}
