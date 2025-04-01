//
//  postsListViewController.swift
//  Enlazar2
//
//  Created by David Santiago Jamaica Galvis on 3/26/25.
//

import UIKit

class PostsListViewController: UITableViewController {
    
    @IBOutlet weak var imageCell: UIImageView!
    
    @IBOutlet weak var titleCell: UITableViewCell!
    
    @IBOutlet weak var descriptionCell: UITableViewCell!
    
    let post: Posts
    
    init?(post: Posts, coder: NSCoder) {
        self.post = post
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imageCell.image = UIImage(named: post.title)
        
        var titleConfig = titleCell.defaultContentConfiguration()
        titleConfig.text = post.title
        titleCell.contentConfiguration = titleConfig
        
        var descriptionConfig = descriptionCell.defaultContentConfiguration()
        descriptionConfig.text = post.description.joined(separator: ", ")
        descriptionCell.contentConfiguration = descriptionConfig
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
