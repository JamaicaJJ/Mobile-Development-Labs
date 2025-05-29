//
//  OrderTableViewController.swift
//  OrderApp
//
//  Created by David Santiago Jamaica Galvis on 5/9/25.
//
import UIKit

class OrderTableViewController: UITableViewController  {

    var minutesToPrepareOrder = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(OrderItemCell.self, forCellReuseIdentifier: "OrderItem")


        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Submit", style: .plain, target: self, action: #selector(submitTapped))

        NotificationCenter.default.addObserver(self, selector: #selector(UITableView.reloadData),
                                               name: MenuController.orderUpdatedNotification, object: nil)
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    @objc func submitTapped(_ sender: Any) {
        let orderTotal = MenuController.shared.order.menuItems.reduce(0.0) { (result, menuItem) -> Double in
            return result + menuItem.price
        }

        let formattedTotal = orderTotal.formatted(.currency(code: "USD"))

        let alertController = UIAlertController(
            title: "Confirm Order",
            message: "You are about to submit your order with a total of \(formattedTotal). Do you wish to proceed?",
            preferredStyle: .actionSheet
        )

        alertController.addAction(UIAlertAction(title: "Submit", style: .default, handler: { _ in
            self.uploadOrder()
        }))

        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))

        present(alertController, animated: true, completion: nil)
    }

    func uploadOrder() {
        Task.init {
            do {
                let menuIDs = MenuController.shared.order.menuItems.map { $0.id }

                let minutesToPrepare = try await MenuController.shared.submitOrder(forMenuIDs: menuIDs)

                self.minutesToPrepareOrder = minutesToPrepare
                self.performSegue(withIdentifier: "confirmOrder", sender: nil)
            } catch {
                self.displayError(error, title: "Order Submission Failed")
            }
        }
    }

    func displayError(_ error: Error, title: String) {
        guard let _ = viewIfLoaded?.window else { return }

        let alert = UIAlertController(title: title, message: error.localizedDescription, preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))

        self.present(alert, animated: true, completion: nil)
    }

    // MARK: - Unwind Segue

    @IBAction func unwindToOrderList(segue: UIStoryboardSegue) {
        if segue.identifier == "dismissConfirmation" {
            MenuController.shared.order.menuItems.removeAll()
        }
    }

    // MARK: - Table View Data Source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1  
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MenuController.shared.order.menuItems.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let menuItem = MenuController.shared.order.menuItems[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderItem", for: indexPath) as! OrderItemCell
        cell.titleLabel.text = "\(menuItem.name)  $\(menuItem.price)"
        return cell
    }

    func configure(_ cell: UITableViewCell, forItemAt indexPath: IndexPath) {
        let menuItem = MenuController.shared.order.menuItems[indexPath.row]

        var content = cell.defaultContentConfiguration()
        content.text = menuItem.name
        content.secondaryText = menuItem.price.formatted(.currency(code: "USD"))

        content.image = UIImage(systemName: "photo.on.rectangle")

        cell.contentConfiguration = content
    }

    // MARK: - Table View Editing

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    // Method to handle deletion
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            MenuController.shared.order.menuItems.remove(at: indexPath.row)

           
        }
    }
   


    // MARK: - Segue Handling

    @IBSegueAction func confirmOrder(_ coder: NSCoder) -> OrderConfirmationViewController? {
        return OrderConfirmationViewController(coder: coder, minutesToPrepare: minutesToPrepareOrder)
    }
}

