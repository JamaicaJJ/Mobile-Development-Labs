//
//  OrderConfirmationViewController.swift
//  OrderApp
//
//  Created by David Santiago Jamaica Galvis on 5/12/25.
//
import UIKit

class OrderConfirmationViewController: UIViewController {
    
    var minutesToPrepare: Int

    init?(coder: NSCoder, minutesToPrepare: Int) {
        self.minutesToPrepare = minutesToPrepare
        super.init(coder: coder)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @IBOutlet weak var confirmationLabel: UILabel!
    @IBOutlet weak var preparationTimeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        confirmationLabel.text = "Your order has been placed!"
        preparationTimeLabel.text = "Expected preparation time: \(minutesToPrepare) minutes"
        
        confirmationLabel.numberOfLines = 0
        preparationTimeLabel.numberOfLines = 0
        confirmationLabel.textAlignment = .center
        preparationTimeLabel.textAlignment = .center
    }

    
    @IBAction func submitTapped(_ sender: Any) {
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
       
        let menuIds = MenuController.shared.order.menuItems.map { $0.id }
        
       
        Task {
            do {
                
                let minutesToPrepare = try await MenuController.shared.submitOrder(forMenuIDs: menuIds)
                
               
                self.minutesToPrepare = minutesToPrepare
                self.performSegue(withIdentifier: "confirmOrder", sender: self)
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
}

