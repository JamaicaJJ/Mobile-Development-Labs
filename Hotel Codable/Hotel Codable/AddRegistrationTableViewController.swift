//
//  AddRegistrationTableViewController.swift
//  Hotel Codable
//
//  Created by Samuel Bradshaw  on 3/17/25.
//

import UIKit

class AddRegistrationTableViewController: UITableViewController {

    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var lastNameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    
   
    @IBOutlet var checkOutDateLabel: UILabel!
    @IBOutlet var checkInDateLabel: UILabel!
    @IBOutlet var checkInDatePicker: UIDatePicker!
    @IBOutlet var checkOutDatePicker: UIDatePicker!
    
    let checkInDateLabelCellIndexPath = IndexPath(row: 0, section: 1)
    let checkInDatePickerCellIndexPath = IndexPath(row: 1, section: 1)
    let checkOutDateLabelCellIndexPath = IndexPath(row: 2, section: 1)
    let checkOutDatePickerCellIndexPath = IndexPath(row: 3, section: 1)
    var isCheckInDatePickerVisible: Bool = false {
        didSet{
            checkInDatePicker.isHidden = !isCheckInDatePickerVisible
        }
    }
    var isCheckOutDatePickerVisible: Bool = false {
        didSet{
            checkOutDatePicker.isHidden = !isCheckOutDatePickerVisible
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let midnightToday = Calendar.current.startOfDay(for: Date.now)
        checkInDatePicker.minimumDate = midnightToday
        checkInDatePicker.date = midnightToday
        updateDateViews()
    }

    @IBAction func doneBarButtonTapped(_ sender: Any) {
        let firstName = firstNameTextField.text ?? ""
        let lastName = lastNameTextField.text ?? ""
        let email = emailTextField.text ?? ""
        
        let checkInDate = checkInDatePicker.date
        let checkOutDate = checkOutDatePicker.date
    }
    
    func updateDateViews() {
        checkInDateLabel.text = checkInDatePicker.date.formatted(date: .abbreviated, time: .omitted)
        checkOutDateLabel.text = checkOutDatePicker.date.formatted(date: .abbreviated, time: .omitted)
        
        checkOutDatePicker.minimumDate = Calendar.current.date(byAdding: .day, value: 1, to: checkInDatePicker.date)
    }
        
    @IBAction func datePickerValueChanged(_ sender: Any) {
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath {
        case checkInDatePickerCellIndexPath where isCheckInDatePickerVisible == false: return 0
        case checkOutDatePickerCellIndexPath where isCheckOutDatePickerVisible == false: return 0
        default: return UITableView.automaticDimension
        }
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath {
        case checkInDatePickerCellIndexPath : return 200
        case checkOutDatePickerCellIndexPath : return 200
        default: return UITableView.automaticDimension
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath == checkInDateLabelCellIndexPath && isCheckInDatePickerVisible == false {
            isCheckInDatePickerVisible.toggle()
        }else if indexPath == checkOutDateLabelCellIndexPath && isCheckOutDatePickerVisible == false{
            isCheckOutDatePickerVisible.toggle()
        }else if indexPath == checkInDateLabelCellIndexPath || indexPath == checkOutDateLabelCellIndexPath{
            isCheckInDatePickerVisible.toggle()
            isCheckOutDatePickerVisible.toggle()
        }else {
            return
        }
        
        tableView.beginUpdates()
        tableView.endUpdates()
    }
}
