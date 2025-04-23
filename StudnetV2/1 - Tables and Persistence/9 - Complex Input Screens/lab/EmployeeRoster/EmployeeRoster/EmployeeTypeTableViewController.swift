//
//  EmployeeTypeTableViewController.swift
//  EmployeeRoster
//
//  Created by David Santiago Jamaica Galvis on 4/4/25.
//

import UIKit

// Delegate Protocol
protocol EmployeeTypeTableViewControllerDelegate: AnyObject {
    func employeeTypeTableViewController(_ controller: EmployeeTypeTableViewController, didSelect employeeType: EmployeeType)
}

class EmployeeTypeTableViewController: UITableViewController {

    var employeeType: EmployeeType?
    let employeeTypes: [EmployeeType] = EmployeeType.allCases
    var selectedType : EmployeeType?
    weak var delegate: EmployeeTypeTableViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Select Employee Type"
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employeeTypes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmployeeTypeCell", for: indexPath)
        
        let type = employeeTypes[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = type.description
        cell.contentConfiguration = content

        if employeeType == type {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        selectedType = employeeTypes[indexPath.row]
        
        if let selectedEmployeeType = selectedType {
            delegate?.employeeTypeTableViewController(self, didSelect: selectedEmployeeType)
        }

        self.performSegue(withIdentifier: "detailUnWindSegue", sender: nil)
//        tableView.reloadData()

//        navigationController?.popViewController(animated: true)
    }
}



