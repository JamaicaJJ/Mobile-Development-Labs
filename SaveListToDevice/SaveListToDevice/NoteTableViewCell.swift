//
//  NoteTableViewCell.swift
//  SaveListToDevice
//
//  Created by Benjamin Patch on 3/13/25.
//

import UIKit

class NoteTableViewCell: UITableViewCell {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var dateLabel: UILabel!
    
    var didTypeNote: ((String) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func textFieldValueChanged(_ sender: Any) {
        didTypeNote?(textField.text ?? "")
    }
    
    
    override func prepareForReuse() {
        textField.text = ""
        dateLabel.text = ""
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
