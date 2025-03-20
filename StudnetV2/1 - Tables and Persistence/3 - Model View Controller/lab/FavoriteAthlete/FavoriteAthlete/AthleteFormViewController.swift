//
//  AthleteFormViewController.swift
//  FavoriteAthlete
//
//  Created by David Santiago Jamaica Galvis on 3/13/25.
//

import UIKit

class AthleteFormViewController: UIViewController {
    
    var athlete: Athlete?
    
    @IBOutlet weak var nameOulet: UITextField!
    
    @IBOutlet weak var ageOulet: UITextField!
    
    @IBOutlet weak var leagueOulet: UITextField!
    
    @IBOutlet weak var teamOulet: UITextField!
    
    init?(coder: NSCoder, athlete : Athlete?) {
        self.athlete = athlete
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }
    
    func updateView() {
        if let unwrapedAthlete = athlete {
            nameOulet.text = unwrapedAthlete.name
            ageOulet.text = "\(unwrapedAthlete.age)"
            leagueOulet.text = unwrapedAthlete.league
            teamOulet.text = unwrapedAthlete.team
        }
    }

    @IBAction func saveAction(_ sender: Any) {
        guard let name = nameOulet.text,
              let ageString = ageOulet.text,
              let age = Int(ageString),
              let league = leagueOulet.text,
              let team = teamOulet.text  else { return }
        
        athlete = Athlete(name: name , age: age , league: league, team: team)
        performSegue(withIdentifier: "unWind", sender: self)
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
