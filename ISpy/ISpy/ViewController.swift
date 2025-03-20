//
//  ViewController.swift
//  ISpy
//
//  Created by David Santiago Jamaica Galvis on 3/11/25.
//

import UIKit

class ViewController: UIViewController , UIScrollViewDelegate{
    @IBOutlet weak var pokemonOulet: UIImageView!
    
    @IBOutlet weak var scrollViewOulet: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        scrollViewOulet.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        updateZoomFor(size: view.bounds.size)
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        pokemonOulet
    }
    
    func updateZoomFor(size: CGSize){
        let widthScale = size.width / pokemonOulet.bounds.width
        let heightScale = size.height / pokemonOulet.bounds.height
        let scale = min(widthScale, heightScale)
        scrollViewOulet.minimumZoomScale = scale
        scrollViewOulet.zoomScale = scale
    }
}

