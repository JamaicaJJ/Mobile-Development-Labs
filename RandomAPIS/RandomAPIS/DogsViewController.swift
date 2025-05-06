//
//  DogsViewController.swift
//  RandomAPIS
//
//  Created by David Santiago Jamaica Galvis on 4/29/25.
//

import Foundation
import UIKit
class DogsViewController: UIViewController {
    
    @IBOutlet weak var dogImageOulet: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    
    @IBAction func newButtonPressed(_ sender: Any) {
            Task {
                do {
                    let photoInfo = try await fetchPhotoInfo()
                    let imageData = try Data(contentsOf: photoInfo.message)
                    let image = UIImage(data: imageData)
                    dogImageOulet.image = image
                } catch {
                    print("Failed to fetch photo: \(error)")
                }
            }
        }

    }
