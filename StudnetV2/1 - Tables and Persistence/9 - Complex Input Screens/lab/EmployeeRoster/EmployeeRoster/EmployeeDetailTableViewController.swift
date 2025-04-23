
import UIKit

protocol EmployeeDetailTableViewControllerDelegate: AnyObject {
    func employeeDetailTableViewController(_ controller: EmployeeDetailTableViewController, didSave employee: Employee)
}

class EmployeeDetailTableViewController: UITableViewController, UITextFieldDelegate, EmployeeTypeTableViewControllerDelegate {
  
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var dobLabel: UILabel!
    @IBOutlet var employeeTypeLabel: UILabel!
    @IBOutlet var saveBarButtonItem: UIBarButtonItem!
    
    @IBOutlet weak var employeeTypeOulet: UILabel!
    
    
    
    @IBOutlet weak var dobDatePicker: UIDatePicker!
    
    var isEditingBirthday: Bool = false {
        didSet {
            tableView.beginUpdates()
            tableView.endUpdates()
        }
    }
    
    
    weak var delegate: EmployeeDetailTableViewControllerDelegate?
    var employee: Employee?
    var employeeType: EmployeeType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateView()
        updateSaveButtonState()
    }
    
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        dobLabel.text =
        sender.date.formatted(date: .abbreviated, time: .omitted)
        dobLabel.textColor = .label
    }
    
    @IBAction func detailUnwindSegue(_ unwindSegue: UIStoryboardSegue ){
        let source = unwindSegue.source as! EmployeeTypeTableViewController
        employeeTypeOulet.text = source.selectedType?.description
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 2 {
            if isEditingBirthday {
                return 229
//                return UITableView.automaticDimension
            } else {
                return 0
            }
        }
        return UITableView.automaticDimension
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.row == 1 {
            isEditingBirthday.toggle()
            
            
            if isEditingBirthday {
                dobLabel.textColor = .label
                dobLabel.text = dobDatePicker.date.formatted(date: .abbreviated, time: .omitted)
            } else {
                dobLabel.textColor = .secondaryLabel
            }
            
            
            tableView.reloadData()
        }
    }
    
    
    func updateView() {
        if let employee = employee {
            navigationItem.title = employee.name
            nameTextField.text = employee.name
            
            dobLabel.text = employee.dateOfBirth.formatted(date: .abbreviated, time: .omitted)
            dobLabel.textColor = .label
            employeeTypeLabel.text = employee.employeeType.description
            employeeTypeLabel.textColor = .label
            employeeTypeLabel.text = employee.employeeType.description
            employeeTypeLabel.textColor = .label
        } else {
            navigationItem.title = "New Employee"
        }
    }
    
    private func updateSaveButtonState() {
        let shouldEnableSaveButton = nameTextField.text?.isEmpty == false && employeeType != nil
        saveBarButtonItem.isEnabled = shouldEnableSaveButton
    }
    
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let name = nameTextField.text else {
            return
        }
        
        guard let unwrappedEmployeeType = employee?.employeeType else {
            let defaultEmployeeType: EmployeeType = .exempt
            let employee = Employee(name: name, dateOfBirth: dobDatePicker.date, employeeType: defaultEmployeeType)
            delegate?.employeeDetailTableViewController(self, didSave: employee)
            return
        }
        
        let employee = Employee(name: name, dateOfBirth: dobDatePicker.date, employeeType: unwrappedEmployeeType)
        delegate?.employeeDetailTableViewController(self, didSave: employee)
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        employee = nil
    }
    
    @IBAction func nameTextFieldDidChange(_ sender: UITextField) {
        updateSaveButtonState()
    }
    
    
    @IBSegueAction func showEmployeeTypes(_ coder: NSCoder, sender: Any?) -> EmployeeTypeTableViewController? {
        let employeeTypeViewController = EmployeeTypeTableViewController(coder: coder)
        employeeTypeViewController?.delegate = self
        return employeeTypeViewController
    }
    
     func employeeTypeTableViewController(_ controller: EmployeeTypeTableViewController, didSelect employeeType: EmployeeType) {
         self.employeeType = employeeType
         employeeTypeLabel.text = employeeType.description
         employeeTypeLabel.textColor = .black
         updateSaveButtonState()
     }
    
}
