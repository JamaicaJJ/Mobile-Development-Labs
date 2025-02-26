//
//  ViewController.swift
//  FamilyProyect
//
//  Created by David Santiago Jamaica Galvis on 2/26/25.
//

import UIKit
struct familyMembers {
    var name: String
    var Age: Int
    var Details: String
}
class ViewController: UIViewController {
    
    @IBOutlet weak var BellaDetails: UIButton!
    @IBOutlet weak var AndreaDetails: UIButton!
    @IBOutlet weak var AlejandroDetails: UIButton!
    @IBOutlet weak var MariaDetails: UIButton!
    @IBOutlet weak var EmmanuelDetails: UIButton!
    
    // Array of family members
    var persons = [
        familyMembers(name: "Maria", Age: 17, Details: "She is my little sister , she is 17 years old ,she is very independent,She is very good at managing her money, She loves to sing and lisen music"),
        familyMembers(name: "Alejandro", Age: 41, Details: "My Dad is 41 years old , He is very organied, He likes to workout , He likes to see things related to new technologies such as AI and cryptocurrencies"),
        familyMembers(name: "Andrea", Age: 36, Details: "My mom is very Sweet , She is a hairtransplant nurse , she have 15 years in experience in hairtransplant , she loves to cook, she talks alot"),
        familyMembers(name: "Emmanuel", Age: 12, Details: "My little brother is very energetic , he likes soccer , and playing video games, and his favorite player is Cristiano Ronaldo"),
        familyMembers(name: "Bella", Age: 3, Details: "My dog is very cute , she is 3 years old and its like a baby she only eats and sleeps and somethimes she wants to play but she get tired very quick")
    ]
    
    
    var selectedFamilyMemberDetails: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func AndreaDetailsTapped(_ sender: UIButton) {
        selectedFamilyMemberDetails = persons.first { $0.name == "Andrea" }?.Details
        performSegue(withIdentifier: "showDetailViewController", sender: self)
    }

    @IBAction func AlejandroDetailsTapped(_ sender: UIButton) {
        selectedFamilyMemberDetails = persons.first { $0.name == "Alejandro" }?.Details
        performSegue(withIdentifier: "showDetailViewController", sender: self)
    }

    @IBAction func MariaDetailsTapped(_ sender: UIButton) {
        selectedFamilyMemberDetails = persons.first { $0.name == "Maria" }?.Details
        performSegue(withIdentifier: "showDetailViewController", sender: self)
    }

    
    @IBAction func EmmanuelDetailsTapped(_ sender: UIButton) {
        selectedFamilyMemberDetails = persons.first { $0.name == "Emmanuel" }?.Details
        performSegue(withIdentifier: "showDetailViewController", sender: self)
    }

    @IBAction func bellabButtonTaped(_ sender: Any) {
        selectedFamilyMemberDetails = persons.first { $0.name == "Bella" }?.Details
        performSegue(withIdentifier: "showDetailViewController", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetailViewController" {
            if let detailViewController = segue.destination as? DetailViewController {
                detailViewController.familyMemberDetails = selectedFamilyMemberDetails
            }
        }
    }
}


