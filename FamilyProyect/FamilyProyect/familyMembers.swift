//
//  familyMembers.swift
//  FamilyProyect
//
//  Created by David Santiago Jamaica Galvis on 2/26/25.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailText: UITextView!
    
    var familyMemberDetails: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the details on the text label if available
        detailText.text = familyMemberDetails
    }
}

