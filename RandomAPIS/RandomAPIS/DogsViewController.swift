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
                
                let (imageData, _) = try await URLSession.shared.data(from: photoInfo.message)
               if let image = UIImage(data: imageData) {
                   dogImageOulet.image = image
               } else {
                    print("Could not convert data to image")              }
            } catch {
                print("Failed to fetch photo: \(error)")
            }
        }
    }
}
