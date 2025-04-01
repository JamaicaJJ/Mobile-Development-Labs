//
//  Note.swift
//  SaveListToDevice
//
//  Created by Benjamin Patch on 3/13/25.
//

import Foundation

struct Note: Codable {
    let id: UUID
    var text: String
    var dateCreated: Date
    
    var dateString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        return dateFormatter.string(from: dateCreated)
    }
    
    init() {
        id = UUID()
        text = ""
        dateCreated = Date()
    }
}
