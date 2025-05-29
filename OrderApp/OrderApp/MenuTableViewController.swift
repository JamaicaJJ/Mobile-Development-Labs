//
//  MenuTableViewController.swift
//  OrderApp
//
//  Created by David Santiago Jamaica Galvis on 5/9/25.
//

import UIKit

class MenuTableViewController: UITableViewController {
    
    var order = Order()
    let category: String
    var menuItems = [MenuItem]()
    let menuController = MenuController()
    
    var imageLoadTasks: [IndexPath: Task<Void, Never>] = [:]
    
    
    init?(coder: NSCoder, category: String) {
        self.category = category
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = category.capitalized
        
        Task {
            do {
                let menuItems = try await
                menuController.fetchMenuItems(forCategory: category)
                updateUI(with: menuItems)
            } catch {
                displayError(error, title: "Failed to Fetch Menu Items for \(self.category)")
            }
        }
    }
    
    func updateUI(with menuItems: [MenuItem]) {
        self.menuItems = menuItems
        self.tableView.reloadData()
    }
    
    func displayError(_ error: Error, title: String) {
        guard let _ = viewIfLoaded?.window else { return }
        
        let alert = UIAlertController(title: title,
                                      message: error.localizedDescription,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Table View Data Source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuItem", for: indexPath) as! MenuItemCell
        let menuItem = menuItems[indexPath.row]
        
        cell.configure(with: menuItem)
        
        if cell.currentImage == nil  {
            loadImage(for: menuItem, at: indexPath, in: cell)
        }
        
        return cell
    }
    
    // MARK: - Image Loading
    
    func loadImage(for menuItem: MenuItem, at indexPath: IndexPath, in cell: MenuItemCell) {
        imageLoadTasks[indexPath]?.cancel()
        
        imageLoadTasks[indexPath] = Task {
            if let image = try? await MenuController.shared.fetchImage(from: menuItem.imageURL),
               let currentIndexPath = self.tableView.indexPath(for: cell),
               currentIndexPath == indexPath {
                cell.updateImage(image)
                tableView.reloadData()
            }
            imageLoadTasks[indexPath] = nil
        }
    }
    
    func configure(cell: UITableViewCell, forItemAt indexPath: IndexPath) {
        let menuItem = menuItems[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = menuItem.name
        content.secondaryText = menuItem.price.formatted(.currency(code: "usd"))
        cell.contentConfiguration = content
    }
    
    // MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        imageLoadTasks[indexPath]?.cancel()
        imageLoadTasks.removeValue(forKey: indexPath)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        imageLoadTasks.forEach { $0.value.cancel() }
        imageLoadTasks.removeAll()
    }
    
    
    @IBSegueAction func showMenuItem(_ coder: NSCoder, sender: Any?) -> MenuItemDetailViewController? {
        guard let cell = sender as? UITableViewCell,
              let indexPath = tableView.indexPath(for: cell) else {
            return nil
        }

        let menuItem = menuItems[indexPath.row]
        return MenuItemDetailViewController(coder: coder, menuItem: menuItem)
    }
    
}
