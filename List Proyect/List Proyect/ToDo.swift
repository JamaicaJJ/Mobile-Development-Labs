//
//  ToDo.swift
//  List Proyect
//
//  Created by David Santiago Jamaica Galvis on 4/8/25.
//

import Foundation

struct ToDo: Codable , Equatable {
    var id = UUID()
    var title : String
    var isComplete : Bool
    var dueDate : Date
    var notes : String?
    
    init(title: String, isComplete: Bool, dueDate: Date, notes: String? ) {
       
        self.id = UUID()
        self.title = title
        self.isComplete = isComplete
        self.dueDate = dueDate
        self.notes = notes
    }
    
    static func loadToDos() -> [ToDo]? {
        guard let codedToDos = try? Data(contentsOf: archiveURL) else {
            return nil
        }
        let propertyListDecoder = PropertyListDecoder()
        return try? propertyListDecoder.decode(Array<ToDo>.self, from: codedToDos)
    }

    static func saveToDos(_ toDos: [ToDo]) {
        let propertyListEncoder = PropertyListEncoder()
        let codedToDos = try? propertyListEncoder.encode(toDos)
        try? codedToDos?.write(to: archiveURL, options: .noFileProtection)
    }

    
    static let documentsDirectory =
    FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    static let archiveURL =
    documentsDirectory.appendingPathComponent("toDos")
        .appendingPathExtension("plist")
    
    
}
