//
//  StorageManager.swift
//  SaveListToDevice
//
//  Created by Benjamin Patch on 3/13/25.
//

import Foundation

class StorageManager {
    
    static var current = StorageManager()
    
    var notes: [Note] = []
    
    init() {
        self.notes = loadNotes()
    }
    
    var saveFilePath: URL {
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let saveFileURL = documentDirectory.appendingPathComponent("saved_notes.json")
        return saveFileURL
    }
    
    func loadNotes() -> [Note] {
        guard let notesData = try? Data(contentsOf: saveFilePath) else {
            return []
        }
        let decoder = JSONDecoder()
        do {
            let notes = try decoder.decode([Note].self, from: notesData)
            self.notes = notes
            return notes
        } catch {
            print(error)
            return []
        }
    }
    
    func saveNotes() {
        let encoder = JSONEncoder()
        let notesData = try? encoder.encode(notes)
        try? notesData?.write(to: saveFilePath)
    }
}
